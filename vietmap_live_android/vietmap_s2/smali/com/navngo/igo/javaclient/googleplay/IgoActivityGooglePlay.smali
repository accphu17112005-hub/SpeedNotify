###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay)
.class public abstract Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;
.super Lcom/navngo/igo/javaclient/IgoActivity;
.source "IgoActivityGooglePlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;
    }
.end annotation


# static fields
.field public static final CONNECT_TO_INTERNET:I = 0x2

.field private static final Logname:Ljava/lang/String; = "IgoActivityGooglePlay"

.field public static final NOT_LICENSED:I = 0x1

.field public static final UNKNOWN:I


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mLicenseChecker:Lcom/google/android/vending/licensing/LicenseChecker;

.field private mLicenseCheckerCallback:Lcom/google/android/vending/licensing/LicenseCheckerCallback;

.field mSalt:[B

.field private mStartPrimoCalled:Z

.field private progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 45
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/IgoActivity;-><init>()V

    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    const/16 v0, 0x14

    new-array v0, v0, [B

    .line 70
    fill-array-data v0, :array_10

    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mSalt:[B

    return-void

    :array_10
    .array-data 1
        -0x11t
        0x6et
        0x25t
        0xbt
        0x3ft
        0x5at
        -0x5ft
        0x19t
        -0x6et
        -0xet
        -0x7ft
        -0x7dt
        0x7et
        0x32t
        -0x63t
        0x19t
        -0x7t
        -0x3ct
        0x19t
        -0x71t
    .end array-data
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->startLoaderThread()V

    return-void
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 1

    .line 45
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->playAllow()V

    return-void
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;I)V
    .registers 2

    .line 45
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->playDontAllow(I)V

    return-void
.end method

.method private playAllow()V
    .registers 3

    .line 199
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$2;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private playDontAllow(I)V
    .registers 4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_6

    const/4 v1, 0x2

    if-ne p1, v1, :cond_1e

    .line 209
    :cond_6
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    if-ne p1, v0, :cond_f

    .line 210
    sget p1, Lcom/navngo/igo/javaclient/R$string;->not_licensed:I

    goto :goto_11

    :cond_f
    sget p1, Lcom/navngo/igo/javaclient/R$string;->connect_to_internet:I

    .line 211
    :goto_11
    new-instance v0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;

    invoke-direct {v0, p0, v1, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;Lcom/navngo/igo/javaclient/IgoActivity;I)V

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    const-wide/16 v0, 0x1388

    .line 216
    :try_start_1b
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1e} :catch_1e

    .line 221
    :catch_1e
    :cond_1e
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$4;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$4;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public clearDownloadDatabase()V
    .registers 6

    .line 289
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_71

    .line 290
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_71

    .line 291
    new-instance v1, Ljava/io/File;

    const-string v2, "databases"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 292
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_71

    .line 293
    new-instance v0, Ljava/io/File;

    const-string v2, "DownloadsDB"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    const-string v2, "clearDownloadDatabase() "

    const-string v3, "IgoActivityGooglePlay"

    if-eqz v0, :cond_49

    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/DownloadsDB deleted"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    :cond_49
    new-instance v0, Ljava/io/File;

    const-string v4, "DownloadsDB-journal"

    invoke-direct {v0, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_71

    .line 297
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/DownloadsDB-journal deleted"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_71
    return-void
.end method

.method protected abstract getXorKey()[B
.end method

.method public hideLoadAnimation()V
    .registers 2

    .line 180
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_a

    .line 181
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    const/4 v0, 0x0

    .line 182
    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    :cond_a
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 83
    invoke-super {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_a

    return-void

    :cond_a
    const/4 p1, 0x2

    .line 89
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->requestWindowFeature(I)Z

    const/4 p1, 0x5

    .line 90
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->requestWindowFeature(I)Z

    return-void
.end method

.method protected onDestroy()V
    .registers 1

    .line 166
    invoke-super {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->onDestroy()V

    return-void
.end method

.method protected onPermissionsGranted()V
    .registers 8

    .line 95
    invoke-super {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->onPermissionsGranted()V

    .line 97
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    const/4 v0, 0x0

    .line 102
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mStartPrimoCalled:Z

    .line 105
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 107
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 108
    new-instance v4, Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 113
    :goto_33
    iget-object v2, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mSalt:[B

    array-length v3, v2

    if-ge v1, v3, :cond_4c

    .line 114
    aget-byte v3, v2, v1

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    rem-int v5, v1, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    int-to-byte v5, v5

    xor-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    .line 123
    :cond_4c
    sget-boolean v1, Lcom/navngo/igo/javaclient/Config;->publicKeyDecodeNeeded:Z

    if-eqz v1, :cond_6c

    .line 124
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->getXorKey()[B

    move-result-object v1

    const/4 v2, 0x0

    .line 127
    :goto_55
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->playStorePublicKey:[B

    array-length v3, v3

    if-ge v2, v3, :cond_6a

    .line 128
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->playStorePublicKey:[B

    aget-byte v5, v3, v2

    array-length v6, v1

    rem-int v6, v2, v6

    aget-byte v6, v1, v6

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_55

    .line 130
    :cond_6a
    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->publicKeyDecodeNeeded:Z

    .line 133
    :cond_6c
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mHandler:Landroid/os/Handler;

    .line 134
    new-instance v0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mLicenseCheckerCallback:Lcom/google/android/vending/licensing/LicenseCheckerCallback;

    .line 135
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->setLicenseChecker(Ljava/lang/String;)V

    return-void
.end method

.method protected setLicenseChecker(Ljava/lang/String;)V
    .registers 7

    .line 142
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->playStorePublicKey:[B

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 157
    new-instance v1, Lcom/google/android/vending/licensing/ServerManagedPolicy;

    new-instance v2, Lcom/google/android/vending/licensing/AESObfuscator;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mSalt:[B

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, p1}, Lcom/google/android/vending/licensing/AESObfuscator;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, p0, v2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;-><init>(Landroid/content/Context;Lcom/google/android/vending/licensing/Obfuscator;)V

    .line 159
    new-instance p1, Lcom/google/android/vending/licensing/LicenseChecker;

    invoke-direct {p1, p0, v1, v0}, Lcom/google/android/vending/licensing/LicenseChecker;-><init>(Landroid/content/Context;Lcom/google/android/vending/licensing/Policy;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mLicenseChecker:Lcom/google/android/vending/licensing/LicenseChecker;

    .line 160
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mLicenseCheckerCallback:Lcom/google/android/vending/licensing/LicenseCheckerCallback;

    invoke-virtual {p1, v0}, Lcom/google/android/vending/licensing/LicenseChecker;->checkAccess(Lcom/google/android/vending/licensing/LicenseCheckerCallback;)V

    return-void
.end method

.method protected showLoadAnimation()V
    .registers 4

    .line 170
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    .line 171
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/navngo/igo/javaclient/R$string;->loading_motonav:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showLoadAnimation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IgoActivityGooglePlay"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 174
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 175
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 176
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    return-void
.end method

.method protected startPrimo()V
    .registers 3

    const-string v0, "IgoActivityGooglePlay"

    const-string v1, "startPrimo()"

    .line 186
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mStartPrimoCalled:Z

    if-nez v0, :cond_16

    const/4 v0, 0x1

    .line 188
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->mStartPrimoCalled:Z

    .line 189
    new-instance v0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_16
    return-void
.end method

###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.AnonymousClass1 (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay$1)
.class Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;
.super Ljava/lang/Object;
.source "IgoActivityGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->startPrimo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 2

    .line 189
    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 191
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->showLoadAnimation()V

    .line 192
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$100(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.AnonymousClass2 (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay$2)
.class Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$2;
.super Ljava/lang/Object;
.source "IgoActivityGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->playAllow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 2

    .line 199
    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 201
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->startPrimo()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.AnonymousClass3 (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay$3)
.class Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;
.super Ljava/lang/Object;
.source "IgoActivityGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->playDontAllow(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

.field final synthetic val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$stringId:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 4

    .line 211
    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p3, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;->val$stringId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 212
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$3;->val$stringId:I

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.AnonymousClass4 (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay$4)
.class Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$4;
.super Ljava/lang/Object;
.source "IgoActivityGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->playDontAllow(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 2

    .line 221
    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$4;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 223
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$4;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->finish()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.PlayLicenseCheckerCallback (com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay$PlayLicenseCheckerCallback)
.class Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;
.super Ljava/lang/Object;
.source "IgoActivityGooglePlay.java"

# interfaces
.implements Lcom/google/android/vending/licensing/LicenseCheckerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlayLicenseCheckerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V
    .registers 2

    .line 228
    iput-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$1;)V
    .registers 3

    .line 228
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;-><init>(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    return-void
.end method


# virtual methods
.method public allow(I)V
    .registers 3

    const/16 v0, 0x100

    if-ne p1, v0, :cond_a

    .line 233
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$200(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    goto :goto_1a

    :cond_a
    const/16 v0, 0x123

    if-ne p1, v0, :cond_14

    .line 236
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$200(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;)V

    goto :goto_1a

    .line 238
    :cond_14
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$300(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;I)V

    :goto_1a
    return-void
.end method

.method public applicationError(I)V
    .registers 5

    packed-switch p1, :pswitch_data_36

    const-string v0, "unknown error"

    goto :goto_17

    :pswitch_6
    const-string v0, "ERROR_MISSING_PERMISSION"

    goto :goto_17

    :pswitch_9
    const-string v0, "ERROR_INVALID_PUBLIC_KEY"

    goto :goto_17

    :pswitch_c
    const-string v0, "ERROR_CHECK_IN_PROGRESS"

    goto :goto_17

    :pswitch_f
    const-string v0, "ERROR_NOT_MARKET_MANAGED"

    goto :goto_17

    :pswitch_12
    const-string v0, "ERROR_NON_MATCHING_UID"

    goto :goto_17

    :pswitch_15
    const-string v0, "ERROR_INVALID_PACKAGE_NAME"

    :goto_17
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 283
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object v0, v1, p1

    const-string p1, "response: application error %d: %s"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "IgoActivityGooglePlay"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x231

    .line 284
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->dontAllow(I)V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method

.method public dontAllow(I)V
    .registers 3

    const/16 v0, 0x231

    if-ne p1, v0, :cond_b

    .line 245
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$300(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;I)V

    goto :goto_1c

    :cond_b
    const/16 v0, 0x123

    if-ne p1, v0, :cond_16

    .line 248
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$300(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;I)V

    goto :goto_1c

    .line 250
    :cond_16
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay$PlayLicenseCheckerCallback;->this$0:Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->access$300(Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;I)V

    :goto_1c
    return-void
.end method
