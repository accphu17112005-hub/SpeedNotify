###### Class com.navngo.igo.javaclient.utils.AntHttpUtility (com.navngo.igo.javaclient.utils.AntHttpUtility)
.class public Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.super Ljava/lang/Object;
.source "AntHttpUtility.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;,
        Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;,
        Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;,
        Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;
    }
.end annotation


# static fields
.field private static final RESPONSE_BUFSIZE:I = 0x20000

.field private static final logname:Ljava/lang/String; = "AntHttpUtility"


# instance fields
.field private mRequestCounter:I

.field private mRequestMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestPool:Ljava/util/concurrent/ThreadPoolExecutor;

.field private mSSLContext:Ljavax/net/ssl/SSLContext;

.field private mSSLLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 9

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 152
    iput v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestCounter:I

    .line 153
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    .line 157
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x64

    invoke-direct {v7, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    const/4 v2, 0x4

    const/4 v3, 0x4

    const-wide/16 v4, 0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestPool:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 164
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLLock:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 165
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLContext:Ljavax/net/ssl/SSLContext;

    .line 121
    sget-object v1, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    if-eqz v1, :cond_38

    .line 122
    new-instance v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;

    invoke-direct {v1, p0, v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;-><init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$1;)V

    invoke-static {v1}, Ljava/net/ProxySelector;->setDefault(Ljava/net/ProxySelector;)V

    :cond_38
    return-void
.end method

.method private createSSLContext()Ljavax/net/ssl/SSLContext;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    const/16 v0, 0x1000

    new-array v1, v0, [B

    .line 464
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    const-string v4, "android_linked_root"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 468
    :try_start_e
    new-instance v4, Ljava/io/BufferedInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    new-instance v6, Ljava/io/File;

    sget-object v7, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_key:Ljava/lang/String;

    invoke-direct {v6, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1f
    .catchall {:try_start_e .. :try_end_1f} :catchall_cf

    .line 469
    :try_start_1f
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_cc

    if-lez v5, :cond_b5

    if-ge v5, v0, :cond_b5

    .line 475
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    const-string v0, "RSA"

    .line 479
    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    .line 480
    new-instance v4, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v4, v1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v0

    const-string v1, "X.509"

    .line 481
    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 483
    sget-object v4, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_password:Ljava/lang/String;

    .line 484
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v5

    .line 485
    invoke-static {v5}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v5

    .line 486
    invoke-virtual {v5, v3, v3}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 488
    sget-object v6, Lcom/navngo/igo/javaclient/Config;->android_ssl_trusted_certs:[Ljava/lang/String;

    array-length v7, v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_51
    if-ge v9, v7, :cond_64

    aget-object v10, v6, v9

    .line 489
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v2, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, v11, v10}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->loadCertificate(Ljava/security/cert/CertificateFactory;Ljava/io/File;Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v11

    .line 490
    invoke-virtual {v5, v10, v11}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_51

    .line 492
    :cond_64
    new-instance v6, Ljava/io/File;

    sget-object v7, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    invoke-direct {v6, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    invoke-static {v1, v6, v2}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->loadCertificate(Ljava/security/cert/CertificateFactory;Ljava/io/File;Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v1

    .line 493
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    new-instance v6, Ljava/security/KeyStore$PrivateKeyEntry;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/security/cert/Certificate;

    aput-object v1, v7, v8

    invoke-direct {v6, v0, v7}, Ljava/security/KeyStore$PrivateKeyEntry;-><init>(Ljava/security/PrivateKey;[Ljava/security/cert/Certificate;)V

    new-instance v0, Ljava/security/KeyStore$PasswordProtection;

    .line 496
    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 493
    invoke-virtual {v5, v2, v6, v0}, Ljava/security/KeyStore;->setEntry(Ljava/lang/String;Ljava/security/KeyStore$Entry;Ljava/security/KeyStore$ProtectionParameter;)V

    .line 498
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v0

    .line 499
    invoke-static {v0}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v0

    .line 500
    invoke-virtual {v0, v5}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 502
    invoke-static {}, Ljavax/net/ssl/KeyManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 503
    invoke-static {v1}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v1

    .line 504
    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v1, v5, v2}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    const-string v2, "TLS"

    .line 506
    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v2

    .line 507
    invoke-virtual {v1}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    invoke-virtual {v0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    invoke-virtual {v2, v1, v0, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    return-object v2

    .line 471
    :cond_b5
    :try_start_b5
    new-instance v0, Ljava/security/spec/InvalidKeySpecException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "private key has strange size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_cc
    .catchall {:try_start_b5 .. :try_end_cc} :catchall_cc

    :catchall_cc
    move-exception v0

    move-object v3, v4

    goto :goto_d0

    :catchall_cf
    move-exception v0

    :goto_d0
    if-eqz v3, :cond_d5

    .line 475
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 477
    :cond_d5
    throw v0
.end method

.method private static loadCertificate(Ljava/security/cert/CertificateFactory;Ljava/io/File;Ljava/lang/String;)Ljava/security/cert/Certificate;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 449
    :try_start_1
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_36

    .line 450
    :try_start_b
    invoke-virtual {p0, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p0
    :try_end_f
    .catchall {:try_start_b .. :try_end_f} :catchall_33

    .line 453
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 456
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " certificate DN="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object p2, p0

    check-cast p2, Ljava/security/cert/X509Certificate;

    invoke-virtual {p2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AntHttpUtility"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :catchall_33
    move-exception p0

    move-object v0, v1

    goto :goto_37

    :catchall_36
    move-exception p0

    :goto_37
    if-eqz v0, :cond_3c

    .line 453
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 455
    :cond_3c
    throw p0
.end method

.method private setupSSL(ILjavax/net/ssl/HttpsURLConnection;)V
    .registers 8

    const-string v0, "AntHttpUtility"

    .line 428
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setting up SSL for request ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLLock:Ljava/lang/Object;

    monitor-enter v0

    .line 430
    :try_start_1e
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLContext:Ljavax/net/ssl/SSLContext;
    :try_end_20
    .catchall {:try_start_1e .. :try_end_20} :catchall_55

    if-nez v1, :cond_48

    .line 432
    :try_start_22
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->createSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLContext:Ljavax/net/ssl/SSLContext;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_28} :catch_29
    .catchall {:try_start_22 .. :try_end_28} :catchall_55

    goto :goto_48

    :catch_29
    move-exception v1

    :try_start_2a
    const-string v2, "AntHttpUtility"

    .line 434
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "couldn\'t set up pinned SSL context for request ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "], using default context: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    :cond_48
    :goto_48
    monitor-exit v0
    :try_end_49
    .catchall {:try_start_2a .. :try_end_49} :catchall_55

    .line 438
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mSSLContext:Ljavax/net/ssl/SSLContext;

    if-eqz p1, :cond_54

    .line 439
    invoke-virtual {p1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_54
    return-void

    :catchall_55
    move-exception p1

    .line 437
    :try_start_56
    monitor-exit v0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_55

    throw p1
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 181
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 182
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->igoKillRequest(I)V

    goto :goto_a

    :cond_1e
    return-void
.end method

.method getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;
    .registers 4

    .line 219
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    monitor-enter v0

    .line 220
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    monitor-exit v0

    return-object p1

    :catchall_11
    move-exception p1

    .line 221
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw p1
.end method

.method public igoAddContentPiece(I[BZ)V
    .registers 8

    const-string v0, "AntHttpUtility"

    .line 241
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AddContentPiece, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", len(Data)="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", IsFinal="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    if-nez v0, :cond_44

    const-string p2, "AntHttpUtility"

    .line 244
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot find request, id="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_44
    if-eqz p2, :cond_d3

    .line 247
    array-length v1, p2

    if-lez v1, :cond_d3

    .line 248
    iget-object v1, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    monitor-enter v1

    .line 249
    :try_start_4c
    iget-object v2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->getDoOutput()Z

    move-result v2

    if-nez v2, :cond_6c

    const-string p2, "AntHttpUtility"

    .line 250
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot add content to a GET request: id="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    monitor-exit v1

    return-void

    .line 253
    :cond_6c
    monitor-exit v1
    :try_end_6d
    .catchall {:try_start_4c .. :try_end_6d} :catchall_d0

    .line 254
    iget-object v1, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->isOutputClosed()Z

    move-result v1

    if-nez v1, :cond_b9

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v1

    sget-object v2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v1, v2, :cond_b9

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v1

    sget-object v2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->ERROR:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-ne v1, v2, :cond_86

    goto :goto_b9

    .line 259
    :cond_86
    :try_start_86
    iget-object v1, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 260
    iget-object p2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_98} :catch_99

    goto :goto_d3

    :catch_99
    move-exception p2

    const-string v1, "AntHttpUtility"

    .line 262
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error during writing of request data, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d3

    :cond_b9
    :goto_b9
    const-string p2, "AntHttpUtility"

    .line 255
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot add content to this request anymore: id="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_d0
    move-exception p1

    .line 253
    :try_start_d1
    monitor-exit v1
    :try_end_d2
    .catchall {:try_start_d1 .. :try_end_d2} :catchall_d0

    throw p1

    :cond_d3
    :goto_d3
    if-eqz p3, :cond_fe

    .line 267
    :try_start_d5
    iget-object p2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_d5 .. :try_end_de} :catch_df

    goto :goto_fe

    :catch_df
    move-exception p2

    const-string p3, "AntHttpUtility"

    .line 269
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error closing request data, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    :cond_fe
    :goto_fe
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object p2

    sget-object p3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->QUEUED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-ne p2, p3, :cond_12f

    .line 273
    sget-object p2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->WAITING_FOR_CONNECTION:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v0, p2}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->setStatus(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    .line 274
    new-instance p2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    invoke-direct {p2, p0, v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;-><init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;)V

    iput-object p2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    const-string p2, "AntHttpUtility"

    .line 275
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Executing request: id="

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestPool:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_12f
    return-void
.end method

.method public igoAddHeader(ILjava/lang/String;Ljava/lang/String;)V
    .registers 8

    const-string v0, "AntHttpUtility"

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AddHeader, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", Name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", Value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    if-nez v0, :cond_43

    const-string p2, "AntHttpUtility"

    .line 228
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot find request "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 232
    :cond_43
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v1

    sget-object v2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->QUEUED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v1, v2, :cond_61

    const-string v1, "AntHttpUtility"

    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Too late to add header for request, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    :cond_61
    iget-object p1, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    monitor-enter p1

    .line 236
    :try_start_64
    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v0, p2, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    monitor-exit p1

    return-void

    :catchall_6b
    move-exception p2

    monitor-exit p1
    :try_end_6d
    .catchall {:try_start_64 .. :try_end_6d} :catchall_6b

    throw p2
.end method

.method public igoCreateRequest(Ljava/lang/String;Ljava/lang/String;)I
    .registers 10

    .line 189
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 190
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_72

    const-string v1, "POST"

    .line 196
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const-string v1, "Content-Type"

    const-string v2, ""

    .line 199
    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 202
    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 206
    :cond_1c
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    monitor-enter v1

    .line 207
    :try_start_1f
    iget v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestCounter:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestCounter:I

    .line 208
    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v6, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->QUEUED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-direct {v5, p0, v2, v0, v6}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;-><init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;ILjava/net/URLConnection;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "AntHttpUtility"

    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CreateRequest, id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", inURL="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", RequestMethod="

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    monitor-exit v1
    :try_end_61
    .catchall {:try_start_1f .. :try_end_61} :catchall_6f

    .line 212
    instance-of p1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz p1, :cond_6e

    sget-boolean p1, Lcom/navngo/igo/javaclient/Config;->android_ssl_pinning:Z

    if-eqz p1, :cond_6e

    .line 213
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {p0, v2, v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->setupSSL(ILjavax/net/ssl/HttpsURLConnection;)V

    :cond_6e
    return v2

    :catchall_6f
    move-exception p1

    .line 210
    :try_start_70
    monitor-exit v1
    :try_end_71
    .catchall {:try_start_70 .. :try_end_71} :catchall_6f

    throw p1

    :catch_72
    move-exception p1

    const-string p2, "AntHttpUtility"

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CreateRequest, Error during creating connection, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method

.method public igoGetAllHeader(I)[B
    .registers 8

    const-string v0, "AntHttpUtility"

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GetAllHeader, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_36

    const-string v0, "AntHttpUtility"

    .line 327
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find request, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, v1, [B

    return-object p1

    .line 330
    :cond_36
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v2

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v2, v3, :cond_5f

    .line 331
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v2

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v2, v3, :cond_5f

    const-string v0, "AntHttpUtility"

    .line 332
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not recieved response yet, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, v1, [B

    return-object p1

    .line 336
    :cond_5f
    iget-object v2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    monitor-enter v2

    .line 337
    :try_start_62
    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    .line 338
    monitor-exit v2
    :try_end_69
    .catchall {:try_start_62 .. :try_end_69} :catchall_fb

    .line 340
    new-instance v2, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v2}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>()V

    .line 341
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v4, 0x0

    .line 346
    :try_start_74
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_78} :catch_79

    goto :goto_7a

    :catch_79
    const/4 v4, 0x0

    .line 353
    :goto_7a
    :try_start_7a
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v5

    if-eqz v4, :cond_82

    const/4 v4, 0x1

    goto :goto_83

    :cond_82
    const/4 v4, 0x0

    :goto_83
    sub-int/2addr v5, v4

    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 355
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8f
    :goto_8f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 356
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_a2

    goto :goto_8f

    .line 358
    :cond_a2
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 359
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 360
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 361
    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_d1
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_d1} :catch_d9

    goto :goto_c2

    .line 368
    :cond_d2
    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p1

    iget-object p1, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    return-object p1

    :catch_d9
    move-exception v0

    const-string v2, "AntHttpUtility"

    .line 365
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Serializing headerMap failed, id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, v1, [B

    return-object p1

    :catchall_fb
    move-exception p1

    .line 338
    :try_start_fc
    monitor-exit v2
    :try_end_fd
    .catchall {:try_start_fc .. :try_end_fd} :catchall_fb

    throw p1
.end method

.method public igoGetHeaderKeys(I)Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 8

    .line 372
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2a

    const-string v0, "AntHttpUtility"

    .line 374
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find request "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    new-instance p1, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v0, v2, [Ljava/lang/Object;

    const-string v2, ""

    aput-object v2, v0, v1

    invoke-direct {p1, v0}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object p1

    .line 377
    :cond_2a
    monitor-enter v0

    .line 378
    :try_start_2b
    iget-object v3, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    sget-object v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v3, v4, :cond_5a

    iget-object v3, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    sget-object v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v3, v4, :cond_5a

    const-string v3, "AntHttpUtility"

    .line 380
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Not recieved response yet "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    new-instance p1, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, ""

    aput-object v3, v2, v1

    invoke-direct {p1, v2}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    monitor-exit v0

    return-object p1

    .line 383
    :cond_5a
    iget-object p1, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {p1}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object p1

    const-string v3, ""

    .line 385
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6a
    :goto_6a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_6a

    .line 387
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_6a

    .line 389
    :cond_8d
    new-instance p1, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v1

    invoke-direct {p1, v2}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    monitor-exit v0

    return-object p1

    :catchall_98
    move-exception p1

    .line 390
    monitor-exit v0
    :try_end_9a
    .catchall {:try_start_2b .. :try_end_9a} :catchall_98

    throw p1
.end method

.method public igoGetReply(I)[B
    .registers 8

    .line 304
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "AntHttpUtility"

    if-nez v0, :cond_20

    .line 306
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find request, id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, v1, [B

    return-object p1

    .line 310
    :cond_20
    :try_start_20
    iget-object v3, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 311
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GetReply, id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", available_bytes="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    new-array v4, v3, [B

    if-lez v3, :cond_53

    .line 314
    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_53} :catch_54

    :cond_53
    return-object v4

    :catch_54
    move-exception v0

    .line 318
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception during reading from http request, id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    new-array p1, v1, [B

    return-object p1
.end method

.method public igoGetRequestStatus(I)I
    .registers 5

    .line 418
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GetRequestStatus, id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AntHttpUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    if-nez v0, :cond_37

    .line 421
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find request, id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    sget-object p1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->UNKNOWN_REQUEST:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->getValue()I

    move-result p1

    return p1

    .line 424
    :cond_37
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object p1

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->getValue()I

    move-result p1

    return p1
.end method

.method public igoGetStatusCode(I)I
    .registers 7

    const-string v0, "AntHttpUtility"

    .line 393
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GetStatusCode, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_34

    const-string v0, "AntHttpUtility"

    .line 396
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find request, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 399
    :cond_34
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v2

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v2, v3, :cond_5b

    .line 400
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    move-result-object v2

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    if-eq v2, v3, :cond_5b

    const-string v0, "AntHttpUtility"

    .line 401
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not recieved response yet, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 405
    :cond_5b
    :try_start_5b
    iget-object v2, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    monitor-enter v2
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_73

    .line 406
    :try_start_5e
    iget-object v3, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    instance-of v3, v3, Ljava/net/HttpURLConnection;

    if-eqz v3, :cond_6e

    .line 407
    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 408
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    monitor-exit v2

    return v0

    .line 410
    :cond_6e
    monitor-exit v2

    goto :goto_92

    :catchall_70
    move-exception v0

    monitor-exit v2
    :try_end_72
    .catchall {:try_start_5e .. :try_end_72} :catchall_70

    :try_start_72
    throw v0
    :try_end_73
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_73} :catch_73

    :catch_73
    move-exception v0

    const-string v2, "AntHttpUtility"

    .line 412
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception during reading of response code id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_92
    return v1
.end method

.method public igoKillRequest(I)V
    .registers 6

    const-string v0, "AntHttpUtility"

    .line 281
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "KillRequest, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    monitor-enter v0

    .line 284
    :try_start_19
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->getRequest(I)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    move-result-object v1

    .line 285
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_19 .. :try_end_27} :catchall_64

    if-nez v1, :cond_40

    const-string v0, "AntHttpUtility"

    .line 288
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find request, id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 291
    :cond_40
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->mRequestPool:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v0, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 292
    iget-object p1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    if-eqz p1, :cond_50

    .line 293
    iget-object p1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->terminate()V

    .line 295
    :cond_50
    iget-object p1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    check-cast p1, Ljava/net/HttpURLConnection;

    if-eqz p1, :cond_59

    .line 297
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 299
    :cond_59
    iget-object p1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->close()V

    .line 300
    iget-object p1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->close()V

    return-void

    :catchall_64
    move-exception p1

    .line 286
    :try_start_65
    monitor-exit v0
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw p1
.end method

.method public registerFunctors()V
    .registers 4

    .line 168
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.http.createRequest"

    const-string v2, "igoCreateRequest"

    .line 169
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.addHeader"

    const-string v2, "igoAddHeader"

    .line 170
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.addContentPiece"

    const-string v2, "igoAddContentPiece"

    .line 171
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.killRequest"

    const-string v2, "igoKillRequest"

    .line 172
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.getReply"

    const-string v2, "igoGetReply"

    .line 173
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.getAllHeader"

    const-string v2, "igoGetAllHeader"

    .line 174
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.getHeaderKeys"

    const-string v2, "igoGetHeaderKeys"

    .line 175
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.getStatusCode"

    const-string v2, "igoGetStatusCode"

    .line 176
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.http.getRequestStatus"

    const-string v2, "igoGetRequestStatus"

    .line 177
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.AntHttpUtility.AnonymousClass1 (com.navngo.igo.javaclient.utils.AntHttpUtility$1)
.class synthetic Lcom/navngo/igo/javaclient/utils/AntHttpUtility$1;
.super Ljava/lang/Object;
.source "AntHttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.navngo.igo.javaclient.utils.AntHttpUtility.HostBasedProxySelector (com.navngo.igo.javaclient.utils.AntHttpUtility$HostBasedProxySelector)
.class Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;
.super Ljava/net/ProxySelector;
.source "AntHttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostBasedProxySelector"
.end annotation


# instance fields
.field private final server_pattern:Ljava/util/regex/Pattern;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;)V
    .registers 2

    .line 89
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;->this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    const-string p1, "^(.*):([0-9]+)$"

    .line 90
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;->server_pattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$1;)V
    .registers 3

    .line 89
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;-><init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;)V

    return-void
.end method

.method private createProxy(Ljava/lang/String;)Ljava/net/Proxy;
    .registers 7

    if-eqz p1, :cond_47

    .line 93
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_47

    .line 95
    :cond_9
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;->server_pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 98
    new-instance p1, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {v2, v3, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {p1, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    return-object p1

    .line 97
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad proxy server specification: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_47
    :goto_47
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    return-object p1
.end method


# virtual methods
.method public connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V
    .registers 4

    return-void
.end method

.method public select(Ljava/net/URI;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 107
    :goto_7
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    array-length v2, v2

    if-ge v1, v2, :cond_73

    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "proxy check: matching "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " against "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "AntHttpUtility"

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    aget-object v2, v2, v1

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_70

    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "proxy found for "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/navngo/igo/javaclient/Config;->android_proxy_servers:[Ljava/lang/String;

    aget-object p1, p1, v1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    sget-object p1, Lcom/navngo/igo/javaclient/Config;->android_proxy_servers:[Ljava/lang/String;

    aget-object p1, p1, v1

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HostBasedProxySelector;->createProxy(Ljava/lang/String;)Ljava/net/Proxy;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0

    :cond_70
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 115
    :cond_73
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.utils.AntHttpUtility.HttpRequestRunnable (com.navngo.igo.javaclient.utils.AntHttpUtility$HttpRequestRunnable)
.class final Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;
.super Ljava/lang/Object;
.source "AntHttpUtility.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HttpRequestRunnable"
.end annotation


# instance fields
.field private final mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

.field private volatile mTerminate:Z

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;)V
    .registers 3

    .line 515
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 516
    iput-object p2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    const/4 p1, 0x0

    .line 517
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    return-void
.end method

.method private reportError()V
    .registers 3

    .line 665
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->ERROR:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .line 521
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AntHttpUtility"

    .line 522
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Start HTTP"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_30
    const-string v1, "AntHttpUtility"

    .line 525
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "connecting"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    monitor-enter v1
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_4b} :catch_372

    .line 527
    :try_start_4b
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->connect()V

    .line 528
    monitor-exit v1
    :try_end_53
    .catchall {:try_start_4b .. :try_end_53} :catchall_36f

    .line 535
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    if-eqz v1, :cond_61

    .line 536
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 537
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    .line 541
    :cond_61
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v1}, Ljava/net/URLConnection;->getDoOutput()Z

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_12f

    :try_start_6d
    const-string v1, "AntHttpUtility"

    .line 544
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "getting output stream"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_8b} :catch_105

    :cond_8b
    const/16 v4, 0x1000

    new-array v4, v4, [B

    .line 555
    :try_start_8f
    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v5, v5, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v5}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .line 556
    iget-boolean v6, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    if-eqz v6, :cond_a0

    return-void

    :cond_a0
    if-ne v5, v2, :cond_a4

    goto/16 :goto_12f

    :cond_a4
    const-string v6, "AntHttpUtility"

    .line 558
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "writing POST message. "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " bytes added. ["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v8, v8, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    monitor-enter v1
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_8f .. :try_end_cf} :catch_db

    .line 560
    :try_start_cf
    invoke-virtual {v1, v4, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 561
    monitor-exit v1
    :try_end_d3
    .catchall {:try_start_cf .. :try_end_d3} :catchall_d8

    .line 562
    :try_start_d3
    iget-boolean v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z
    :try_end_d5
    .catch Ljava/io/IOException; {:try_start_d3 .. :try_end_d5} :catch_db

    if-eqz v4, :cond_8b

    return-void

    :catchall_d8
    move-exception v2

    .line 561
    :try_start_d9
    monitor-exit v1
    :try_end_da
    .catchall {:try_start_d9 .. :try_end_da} :catchall_d8

    :try_start_da
    throw v2
    :try_end_db
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_db} :catch_db

    :catch_db
    move-exception v1

    const-string v2, "AntHttpUtility"

    .line 565
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "writing POST message ["

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "] ERROR, "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V

    return-void

    :catch_105
    move-exception v1

    const-string v2, "AntHttpUtility"

    .line 547
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "getting failed [id="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]: getos: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V

    return-void

    .line 572
    :cond_12f
    :goto_12f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->CONNECTED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v1, v4}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    :try_start_136
    const-string v1, "AntHttpUtility"

    .line 576
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Getting input stream"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    instance-of v1, v1, Ljava/net/HttpURLConnection;

    if-eqz v1, :cond_16c

    .line 578
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 579
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    const/16 v5, 0x190

    if-lt v4, v5, :cond_167

    .line 580
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    goto :goto_18a

    .line 582
    :cond_167
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    goto :goto_18a

    :cond_16c
    const-string v1, "AntHttpUtility"

    .line 587
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Not a HttpURLConnection (then what?), unknown response code"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    :goto_18a
    const-string v4, "AntHttpUtility"

    .line 591
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "Getting input stream ok"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 592
    iget-boolean v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z
    :try_end_1a2
    .catch Ljava/lang/Exception; {:try_start_136 .. :try_end_1a2} :catch_1a5

    if-eqz v4, :cond_1d5

    return-void

    :catch_1a5
    move-exception v1

    .line 597
    :try_start_1a6
    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v4, v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    check-cast v4, Ljava/net/HttpURLConnection;

    .line 598
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    .line 599
    iget-boolean v5, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    if-eqz v5, :cond_1b5

    return-void

    :cond_1b5
    if-nez v4, :cond_1d4

    const-string v2, "AntHttpUtility"

    .line 602
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Getting input stream failed: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V
    :try_end_1d3
    .catch Ljava/lang/Exception; {:try_start_1a6 .. :try_end_1d3} :catch_354

    return-void

    :cond_1d4
    move-object v1, v4

    .line 613
    :cond_1d5
    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v5, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v4, v5}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    const v4, 0xaaaa

    new-array v5, v4, [B

    const/4 v6, 0x0

    .line 621
    :goto_1e2
    :try_start_1e2
    monitor-enter v1
    :try_end_1e3
    .catch Ljava/io/IOException; {:try_start_1e2 .. :try_end_1e3} :catch_32a

    .line 622
    :try_start_1e3
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .line 623
    monitor-exit v1
    :try_end_1e8
    .catchall {:try_start_1e3 .. :try_end_1e8} :catchall_327

    .line 624
    :try_start_1e8
    iget-boolean v8, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    if-eqz v8, :cond_1ed

    return-void

    :cond_1ed
    if-ne v7, v2, :cond_2bb

    .line 627
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V
    :try_end_1f6
    .catch Ljava/io/IOException; {:try_start_1e8 .. :try_end_1f6} :catch_32a

    .line 647
    :try_start_1f6
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_201
    .catch Ljava/io/IOException; {:try_start_1f6 .. :try_end_201} :catch_202

    goto :goto_228

    :catch_202
    move-exception v2

    const-string v3, "AntHttpUtility"

    .line 649
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Cannot close output stream ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v5, v5, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "] :o "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_228
    const-string v2, "AntHttpUtility"

    .line 652
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "Result stream closed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v4, v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    :try_start_24c
    const-string v2, "AntHttpUtility"

    .line 656
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "Closing input ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v4, v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    const-string v1, "AntHttpUtility"

    .line 658
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Closing input done ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v3, v3, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_293
    .catch Ljava/io/IOException; {:try_start_24c .. :try_end_293} :catch_294

    goto :goto_2ba

    :catch_294
    move-exception v1

    const-string v2, "AntHttpUtility"

    .line 660
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Cannot close http connection ["

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "] :o "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2ba
    return-void

    :cond_2bb
    :try_start_2bb
    const-string v8, "AntHttpUtility"

    .line 630
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "Got ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v10, v10, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, "] response bytes: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    add-int/2addr v6, v7

    if-lt v6, v4, :cond_304

    const-string v8, "AntHttpUtility"

    .line 633
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "Notifying c++ side, accumulatedReadSize="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 634
    iget-object v6, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    sget-object v8, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v6, v8}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    const/4 v6, 0x0

    .line 637
    :cond_304
    iget-object v8, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget-object v8, v8, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v8}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-virtual {v8, v5, v3, v7}, Ljava/io/OutputStream;->write([BII)V

    const-string v7, "AntHttpUtility"

    .line 638
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "Response has been written to CircularBuffer"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_325
    .catch Ljava/io/IOException; {:try_start_2bb .. :try_end_325} :catch_32a

    goto/16 :goto_1e2

    :catchall_327
    move-exception v2

    .line 623
    :try_start_328
    monitor-exit v1
    :try_end_329
    .catchall {:try_start_328 .. :try_end_329} :catchall_327

    :try_start_329
    throw v2
    :try_end_32a
    .catch Ljava/io/IOException; {:try_start_329 .. :try_end_32a} :catch_32a

    :catch_32a
    move-exception v1

    const-string v2, "AntHttpUtility"

    .line 640
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Receiving ["

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "] response suxx: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V

    return-void

    :catch_354
    move-exception v0

    const-string v1, "AntHttpUtility"

    .line 607
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Getting input stream failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V

    return-void

    :catchall_36f
    move-exception v2

    .line 528
    :try_start_370
    monitor-exit v1
    :try_end_371
    .catchall {:try_start_370 .. :try_end_371} :catchall_36f

    :try_start_371
    throw v2
    :try_end_372
    .catch Ljava/lang/Exception; {:try_start_371 .. :try_end_372} :catch_372

    :catch_372
    move-exception v1

    const-string v2, "AntHttpUtility"

    .line 530
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "connect failed [id="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]: tryconnect: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->reportError()V

    return-void
.end method

.method public terminate()V
    .registers 3

    .line 669
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Request terminated, id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mRequest:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AntHttpUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 670
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;->mTerminate:Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.AntHttpUtility.Request (com.navngo.igo.javaclient.utils.AntHttpUtility$Request)
.class Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;
.super Ljava/lang/Object;
.source "AntHttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Request"
.end annotation


# instance fields
.field public mConnection:Ljava/net/URLConnection;

.field public mId:I

.field public mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

.field public mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

.field public mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

.field public volatile mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/utils/AntHttpUtility;ILjava/net/URLConnection;Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V
    .registers 5

    .line 126
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->this$0:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput p2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    .line 128
    iput-object p4, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 129
    iput-object p3, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mConnection:Ljava/net/URLConnection;

    const/4 p1, 0x0

    .line 130
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRunnable:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$HttpRequestRunnable;

    .line 132
    new-instance p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;-><init>(Z)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mRequestData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    .line 133
    new-instance p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    const/high16 p2, 0x20000

    invoke-direct {p1, p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;-><init>(I)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mResponseData:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    return-void
.end method


# virtual methods
.method public callStatusCallback(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V
    .registers 6

    .line 139
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->setStatus(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting status to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " for request id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AntHttpUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->getValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const-string p1, "other.http_status_callback"

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public getStatus()Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;
    .registers 3

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public setStatus(Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;)V
    .registers 3

    .line 137
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    monitor-enter v0

    :try_start_3
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$Request;->mStatus:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    monitor-exit v0

    return-void

    :catchall_7
    move-exception p1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p1
.end method

###### Class com.navngo.igo.javaclient.utils.AntHttpUtility.RequestStatus (com.navngo.igo.javaclient.utils.AntHttpUtility$RequestStatus)
.class final enum Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;
.super Ljava/lang/Enum;
.source "AntHttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "RequestStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum CONNECTED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum ERROR:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum QUEUED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum UNKNOWN_REQUEST:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

.field public static final enum WAITING_FOR_CONNECTION:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .line 76
    new-instance v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v1, "QUEUED"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->QUEUED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 77
    new-instance v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v4, "WAITING_FOR_CONNECTION"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->WAITING_FOR_CONNECTION:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 78
    new-instance v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v6, "CONNECTED"

    const/4 v7, 0x3

    invoke-direct {v4, v6, v5, v7}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->CONNECTED:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 79
    new-instance v6, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v8, "RECEIVING_RESPONSE"

    const/4 v9, 0x4

    invoke-direct {v6, v8, v7, v9}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RECEIVING_RESPONSE:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 80
    new-instance v8, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v10, "RESPONSE_READY"

    const/4 v11, 0x5

    invoke-direct {v8, v10, v9, v11}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->RESPONSE_READY:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 81
    new-instance v10, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v12, "ERROR"

    const/4 v13, 0x6

    invoke-direct {v10, v12, v11, v13}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->ERROR:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    .line 82
    new-instance v12, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    const-string v14, "UNKNOWN_REQUEST"

    const/4 v15, 0x7

    invoke-direct {v12, v14, v13, v15}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->UNKNOWN_REQUEST:Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    new-array v14, v15, [Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    aput-object v0, v14, v2

    aput-object v1, v14, v3

    aput-object v4, v14, v5

    aput-object v6, v14, v7

    aput-object v8, v14, v9

    aput-object v10, v14, v11

    aput-object v12, v14, v13

    .line 75
    sput-object v14, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->$VALUES:[Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;
    .registers 2

    .line 75
    const-class v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;
    .registers 1

    .line 75
    sget-object v0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->$VALUES:[Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .registers 2

    .line 86
    iget v0, p0, Lcom/navngo/igo/javaclient/utils/AntHttpUtility$RequestStatus;->value:I

    return v0
.end method
