###### Class com.google.android.gms.common.internal.ConnectionErrorMessages (com.google.android.gms.common.internal.ConnectionErrorMessages)
.class public final Lcom/google/android/gms/common/internal/ConnectionErrorMessages;
.super Ljava/lang/Object;


# static fields
.field private static final zaof:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 96
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaof:Landroidx/collection/SimpleArrayMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppName(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 62
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 63
    :try_start_4
    invoke-static {p0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getApplicationLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_10
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_10} :catch_11
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_10} :catch_11

    return-object p0

    :catch_11
    nop

    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->name:Ljava/lang/String;

    .line 66
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1f

    return-object v0

    :cond_1f
    return-object p0
.end method

.method public static getDefaultNotificationChannelName(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    .line 93
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 94
    sget v0, Lcom/google/android/gms/base/R$string;->common_google_play_services_notification_channel_name:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getErrorDialogButtonMessage(Landroid/content/Context;I)Ljava/lang/String;
    .registers 3

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_23

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1c

    const/4 v0, 0x3

    if-eq p1, v0, :cond_15

    const p1, 0x104000a

    .line 61
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 59
    :cond_15
    sget p1, Lcom/google/android/gms/base/R$string;->common_google_play_services_enable_button:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 60
    :cond_1c
    sget p1, Lcom/google/android/gms/base/R$string;->common_google_play_services_update_button:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 58
    :cond_23
    sget p1, Lcom/google/android/gms/base/R$string;->common_google_play_services_install_button:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getErrorMessage(Landroid/content/Context;I)Ljava/lang/String;
    .registers 7

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 36
    invoke-static {p0}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v3, :cond_8a

    const/4 v4, 0x2

    if-eq p1, v4, :cond_72

    const/4 v4, 0x3

    if-eq p1, v4, :cond_67

    const/4 v4, 0x5

    if-eq p1, v4, :cond_60

    const/4 v4, 0x7

    if-eq p1, v4, :cond_59

    const/16 v4, 0x9

    if-eq p1, v4, :cond_4e

    const/16 v4, 0x14

    if-eq p1, v4, :cond_47

    packed-switch p1, :pswitch_data_96

    .line 50
    sget p0, Lcom/google/android/gms/common/R$string;->common_google_play_services_unknown_issue:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 40
    :pswitch_2e
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_updating_text:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_39
    const-string p1, "common_google_play_services_sign_in_failed_text"

    .line 48
    invoke-static {p0, p1, v1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_40
    const-string p1, "common_google_play_services_api_unavailable_text"

    .line 47
    invoke-static {p0, p1, v1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_47
    const-string p1, "common_google_play_services_restricted_profile_text"

    .line 49
    invoke-static {p0, p1, v1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 44
    :cond_4e
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_unsupported_text:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_59
    const-string p1, "common_google_play_services_network_error_text"

    .line 45
    invoke-static {p0, p1, v1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_60
    const-string p1, "common_google_play_services_invalid_account_text"

    .line 46
    invoke-static {p0, p1, v1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 39
    :cond_67
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_enable_text:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 41
    :cond_72
    invoke-static {p0}, Lcom/google/android/gms/common/util/DeviceProperties;->isWearableWithoutPlayStore(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_7f

    .line 42
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_wear_update_text:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 43
    :cond_7f
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_update_text:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 38
    :cond_8a
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_install_text:I

    new-array p1, v3, [Ljava/lang/Object;

    aput-object v1, p1, v2

    invoke-virtual {v0, p0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_96
    .packed-switch 0x10
        :pswitch_40
        :pswitch_39
        :pswitch_2e
    .end packed-switch
.end method

.method public static getErrorNotificationMessage(Landroid/content/Context;I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x6

    if-ne p1, v0, :cond_e

    .line 53
    invoke-static {p0}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "common_google_play_services_resolution_required_text"

    .line 54
    invoke-static {p0, v0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :cond_e
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->getErrorMessage(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getErrorNotificationTitle(Landroid/content/Context;I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x6

    if-ne p1, v0, :cond_a

    const-string p1, "common_google_play_services_resolution_required_title"

    .line 28
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_e

    .line 29
    :cond_a
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->getErrorTitle(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    :goto_e
    if-nez p1, :cond_1a

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget p1, Lcom/google/android/gms/base/R$string;->common_google_play_services_notification_ticker:I

    .line 33
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :cond_1a
    return-object p1
.end method

.method public static getErrorTitle(Landroid/content/Context;I)Ljava/lang/String;
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "GoogleApiAvailability"

    packed-switch p1, :pswitch_data_86

    :pswitch_a
    const/16 p0, 0x21

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p0, "Unexpected error code "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_21
    const-string p1, "The current user profile is restricted and could not use authenticated features."

    .line 23
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "common_google_play_services_restricted_profile_title"

    .line 24
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2d
    const-string p1, "The specified account could not be signed in."

    .line 21
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "common_google_play_services_sign_in_failed_title"

    .line 22
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_39
    const-string p0, "One of the API components you attempted to connect to is not available."

    .line 19
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_3f
    const-string p0, "The application is not licensed to the user."

    .line 17
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_45
    const-string p0, "Developer error occurred. Please see logs for detailed information"

    .line 13
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_4b
    const-string p0, "Google Play services is invalid. Cannot recover."

    .line 7
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_51
    const-string p0, "Internal error occurred. Please see logs for detailed information"

    .line 11
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :pswitch_57
    const-string p1, "Network error occurred. Please retry request later."

    .line 9
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "common_google_play_services_network_error_title"

    .line 10
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_63
    const-string p1, "An invalid account was specified when connecting. Please provide a valid account."

    .line 15
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "common_google_play_services_invalid_account_title"

    .line 16
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_6f
    return-object v1

    .line 5
    :pswitch_70
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_enable_title:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 6
    :pswitch_77
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_update_title:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 4
    :pswitch_7e
    sget p0, Lcom/google/android/gms/base/R$string;->common_google_play_services_install_title:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_86
    .packed-switch 0x1
        :pswitch_7e
        :pswitch_77
        :pswitch_70
        :pswitch_6f
        :pswitch_63
        :pswitch_6f
        :pswitch_57
        :pswitch_51
        :pswitch_4b
        :pswitch_45
        :pswitch_3f
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_39
        :pswitch_2d
        :pswitch_6f
        :pswitch_a
        :pswitch_21
    .end packed-switch
.end method

.method private static zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 75
    sget-object v0, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaof:Landroidx/collection/SimpleArrayMap;

    monitor-enter v0

    .line 76
    :try_start_3
    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_d

    .line 78
    monitor-exit v0

    return-object v1

    .line 79
    :cond_d
    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getRemoteResource(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p0

    const/4 v1, 0x0

    if-nez p0, :cond_16

    .line 81
    monitor-exit v0

    return-object v1

    :cond_16
    const-string v2, "string"

    const-string v3, "com.google.android.gms"

    .line 82
    invoke-virtual {p0, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_3d

    const-string p0, "GoogleApiAvailability"

    const-string v2, "Missing resource: "

    .line 84
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_33

    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_38

    :cond_33
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_38
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    monitor-exit v0

    return-object v1

    .line 86
    :cond_3d
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 87
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_64

    const-string p0, "GoogleApiAvailability"

    const-string v2, "Got empty resource: "

    .line 88
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_5a

    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_5f

    :cond_5a
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_5f
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    monitor-exit v0

    return-object v1

    .line 90
    :cond_64
    invoke-virtual {v0, p1, p0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    monitor-exit v0

    return-object p0

    :catchall_69
    move-exception p0

    .line 92
    monitor-exit v0
    :try_end_6b
    .catchall {:try_start_3 .. :try_end_6b} :catchall_69

    throw p0
.end method

.method private static zaa(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 69
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 70
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/ConnectionErrorMessages;->zaa(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_10

    .line 72
    sget p0, Lcom/google/android/gms/common/R$string;->common_google_play_services_unknown_issue:I

    .line 73
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 74
    :cond_10
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget-object p1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p1, p0, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
