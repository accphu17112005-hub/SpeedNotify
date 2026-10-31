###### Class com.navngo.igo.javaclient.BuildConfig (com.navngo.igo.javaclient.BuildConfig)
.class public final Lcom/navngo/igo/javaclient/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static final BUILD_TYPE:Ljava/lang/String; = "release"

.field public static final DEBUG:Z = false

.field public static final FLAVOR:Ljava/lang/String; = "GPDND"

.field public static final FLAVOR_DND:Ljava/lang/String; = "DND"

.field public static final FLAVOR_GP:Ljava/lang/String; = "GP"

.field public static final LIBRARY_PACKAGE_NAME:Ljava/lang/String; = "com.navngo.igo.javaclient"

.field public static final TIMESTAMP:J = 0x185ab57e8e3L

.field public static final appname:Ljava/lang/String; = "iGO"

.field public static final def_start_on_boot:Z = false

.field public static final destroy_with_activity:Z = false

.field public static final enable_navigateto_processer:Z = false

.field public static final gdb:Z = false

.field public static final inAppShopEnabled:Z = true

.field public static final install_to_sd:Z = true

.field public static final isGooglePlay:Z = true

.field public static final isNavfusion:Z = false

.field public static final is_synctool:Z = false

.field public static final is_toolbox:Z = false

.field public static final libName:Ljava/lang/String; = "igo_jni"

.field public static final licence_lock_hardcoded_to:Ljava/lang/String; = "android_id"

.field public static final licencing_validity_period:I = 0x1e

.field public static final load_systxt_from_sd:Z = false

.field public static final permission_contacts_is_critical:Z = false

.field public static final permission_location_is_critical:Z = true

.field public static final permission_microphone_is_critical:Z = false

.field public static final permission_phone_is_critical:Z = true

.field public static final permission_storage_is_critical:Z = true

.field public static final playStorePublicKey:[B

.field public static final start_on_GCoor:Z = false

.field public static final useCustomLicensingPolicy:Z = false

.field public static final use_icu_libs:Z = true

.field public static final use_permission_background_location:Z = false

.field public static final use_permission_contacts:Z = false

.field public static final use_permission_location:Z = true

.field public static final use_permission_microphone:Z = false

.field public static final use_permission_phone:Z = false

.field public static final use_permission_storage:Z = true

.field public static final usingOsDownloader:Z = false


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x188

    new-array v0, v0, [B

    .line 56
    fill-array-data v0, :array_a

    sput-object v0, Lcom/navngo/igo/javaclient/BuildConfig;->playStorePublicKey:[B

    return-void

    :array_a
    .array-data 1
        -0xct
        0x25t
        -0x7dt
        -0x69t
        0x5bt
        -0x40t
        -0x4at
        0x11t
        -0xat
        0x66t
        -0x12t
        -0x50t
        -0x56t
        -0x3bt
        -0x76t
        0x58t
        -0x80t
        0x1bt
        -0x6t
        -0x69t
        0x53t
        -0x5t
        -0x4et
        0x19t
        -0xbt
        0x40t
        -0x36t
        -0x7et
        -0x7dt
        -0x1t
        -0x25t
        0x5et
        -0xct
        0x25t
        -0x7dt
        -0x69t
        0x51t
        -0x33t
        -0x44t
        0x1ct
        -0xbt
        0x50t
        -0x40t
        -0x80t
        -0x56t
        -0xat
        -0x77t
        0x79t
        -0x76t
        0x38t
        -0x46t
        -0x79t
        0x7et
        -0x64t
        -0x6dt
        0x6at
        -0x27t
        0x63t
        -0x2dt
        -0x78t
        -0x4dt
        -0x1at
        -0x65t
        0x6bt
        -0x5t
        0x1et
        -0x80t
        -0x62t
        0x7ft
        -0x35t
        -0x4ct
        0x31t
        -0x14t
        0x76t
        -0x38t
        -0x5et
        -0xat
        -0x1dt
        -0x4dt
        0x65t
        -0x76t
        0x5et
        -0x5ft
        -0x67t
        0x65t
        -0x18t
        -0x52t
        0x33t
        -0x7bt
        0x54t
        -0x4t
        -0xbt
        -0x45t
        -0x6t
        -0x67t
        0x4bt
        -0x73t
        0x16t
        -0x51t
        -0x67t
        0x56t
        -0x2et
        -0x71t
        0x2bt
        -0x12t
        0x67t
        -0x50t
        -0x78t
        -0x50t
        -0x68t
        -0x6dt
        0x47t
        -0x12t
        0x5ct
        -0x7et
        -0x54t
        0x64t
        -0x64t
        -0x70t
        0x37t
        -0xet
        0x53t
        -0x4bt
        -0x67t
        -0xct
        -0x19t
        -0x2ct
        0x4ft
        -0x74t
        0xbt
        -0x71t
        -0x54t
        0x64t
        -0x1et
        -0x4et
        0x6at
        -0x7bt
        0x68t
        -0x12t
        -0x65t
        -0x4dt
        -0x1et
        -0x4ft
        0x2at
        -0x29t
        0x1bt
        -0x7bt
        -0x5dt
        0x78t
        -0x1at
        -0x46t
        0xft
        -0x28t
        0x35t
        -0x50t
        -0x7t
        -0x65t
        -0x3at
        -0x67t
        0x5ct
        -0x2t
        0x23t
        -0x47t
        -0x51t
        0x56t
        -0x66t
        -0x4at
        0x19t
        -0x1t
        0x45t
        -0x43t
        -0x54t
        -0x5dt
        -0x39t
        -0x47t
        0x59t
        -0x76t
        0x1ft
        -0x72t
        -0x64t
        0x78t
        -0x27t
        -0x5dt
        0x15t
        -0x2bt
        0x74t
        -0xft
        -0x70t
        -0x13t
        -0x1et
        -0x2at
        0x2at
        -0x32t
        0x1et
        -0x77t
        -0x6ft
        0x54t
        -0x68t
        -0x53t
        0x19t
        -0xft
        0x42t
        -0x3et
        -0x79t
        -0xet
        -0xat
        -0x47t
        0x51t
        -0x11t
        0x2et
        -0x50t
        -0x41t
        0x68t
        -0x7bt
        -0x7et
        0x5t
        -0x7bt
        0x47t
        -0xct
        -0x7ct
        -0xdt
        -0x40t
        -0x49t
        0x29t
        -0xet
        0x14t
        -0x52t
        -0x5bt
        0x58t
        -0x25t
        -0x43t
        0xft
        -0x32t
        0x48t
        -0xet
        -0x70t
        -0x53t
        -0x14t
        -0x7at
        0x4dt
        -0x4t
        0x6t
        -0x1t
        -0x73t
        0x61t
        -0x12t
        -0x65t
        0x3at
        -0x2et
        0x39t
        -0x19t
        -0x4at
        -0x56t
        -0x1bt
        -0x6bt
        0x4ct
        -0x80t
        0x36t
        -0x6t
        -0x68t
        0x26t
        -0x32t
        -0x42t
        0x3ct
        -0x2bt
        0x52t
        -0x12t
        -0x4at
        -0x65t
        -0x1ft
        -0x60t
        0x4ft
        -0x31t
        0x20t
        -0x4et
        -0x13t
        0x74t
        -0x63t
        -0x4ft
        0x28t
        -0x34t
        0x33t
        -0x3ft
        -0x65t
        -0x74t
        -0x4t
        -0x60t
        0x2ct
        -0x72t
        0x24t
        -0x71t
        -0x6et
        0x68t
        -0x6et
        -0x5at
        0x5t
        -0x1t
        0x71t
        -0x23t
        -0x6bt
        -0x45t
        -0x2t
        -0x2dt
        0x30t
        -0x13t
        0x5bt
        -0x43t
        -0x5ft
        0x5bt
        -0x17t
        -0x3at
        0x2dt
        -0x21t
        0x32t
        -0x4et
        -0x4et
        -0x10t
        -0x22t
        -0x7et
        0x2dt
        -0x71t
        0x3dt
        -0x52t
        -0x13t
        0x74t
        -0xdt
        -0x50t
        0x69t
        -0x7dt
        0x46t
        -0x4bt
        -0x6at
        -0x48t
        -0x65t
        -0x80t
        0x66t
        -0x6at
        0x5bt
        -0x7bt
        -0x5ft
        0x5dt
        -0x31t
        -0x42t
        0x1bt
        -0x4t
        0x63t
        -0xct
        -0x54t
        -0x48t
        -0x62t
        -0x4ct
        0x27t
        -0x1ft
        0x5et
        -0x64t
        -0x6et
        0x5bt
        -0x5t
        -0x41t
        0x1et
        -0x1dt
        0x51t
        -0x32t
        -0x7at
        -0x5t
        -0x28t
        -0x60t
        0x51t
        -0x18t
        0xet
        -0x43t
        -0x50t
        0x5ct
        -0x13t
        -0x66t
        0xat
        -0x28t
        0x42t
        -0x50t
        -0x73t
        -0x57t
        -0x18t
        -0x60t
        0x6ft
        -0x2at
        0x1bt
        -0x7dt
        -0x6ft
        0x53t
        -0x5t
        -0x4at
        0x1dt
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
