###### Class com.navngo.igo.javaclient.Config (com.navngo.igo.javaclient.Config)
.class public Lcom/navngo/igo/javaclient/Config;
.super Ljava/lang/Object;
.source "Config.java"


# static fields
.field public static final ANDROID_MUTING_DEVICE_ANDROID:I = 0x1

.field public static final ANDROID_MUTING_DEVICE_AUDIOFOCUS:I = 0x2

.field public static final ANDROID_MUTING_DEVICE_EMPTY:I = 0x0

.field public static final CANVAS_MATRIX_HACK_IDENTITY:I = 0x2

.field public static final CANVAS_MATRIX_HACK_INVERT:I = 0x3

.field public static final CANVAS_MATRIX_HACK_INVERT_NEGOFFSET:I = 0x4

.field public static final CANVAS_MATRIX_HACK_INVERT_ZEROOFFSET:I = 0x5

.field public static final CANVAS_MATRIX_HACK_NONE:I = 0x0

.field public static final CANVAS_MATRIX_HACK_NULL:I = 0x1

.field public static IMD_app_mute:Z = false

.field public static IMD_category:Ljava/lang/String; = null

.field public static IMD_component:Ljava/lang/String; = null

.field public static IMD_exit_action:Ljava/lang/String; = null

.field public static IMD_start_action:Ljava/lang/String; = null

.field public static IMD_stop_action:Ljava/lang/String; = null

.field public static final MOUSE_MATRIX_HACK_INVERT:I = 0x3

.field public static final MOUSE_MATRIX_HACK_NONE:I = 0x0

.field public static final RELOAD_AFTER_MEDIA_SCANNING:I = 0x7

.field public static final RELOAD_AFTER_REBUILD_DATA:I = 0x5

.field public static final RELOAD_AT_BOOT_RECEIVE:I = 0x2

.field public static final RELOAD_AT_INIT:I = 0x0

.field public static final RELOAD_AT_REINIT:I = 0x1

.field public static final RELOAD_BEFORE_MEDIA_SCANNING:I = 0x6

.field public static final RELOAD_BEFORE_SD_READY:I = 0x3

.field public static final RELOAD_ON_MEDIA_CHANGE:I = 0x4

.field public static accuracy_workaround:Z = false

.field private static final aliases_ini:Ljava/lang/String; = "!aliases.ini"

.field public static androidNightModeChangeOnIntent:Z = false

.field public static android_audiofocus_gain_method:I = 0x0

.field public static android_muting_device_name:Ljava/lang/String; = null

.field public static android_proxy_patterns:[Ljava/util/regex/Pattern; = null

.field public static android_proxy_servers:[Ljava/lang/String; = null

.field public static android_ssl_client_cert:Ljava/lang/String; = null

.field public static android_ssl_client_key:Ljava/lang/String; = null

.field public static android_ssl_client_password:Ljava/lang/String; = null

.field public static android_ssl_pinning:Z = false

.field public static android_ssl_trusted_certs:[Ljava/lang/String; = null

.field public static final appname:Ljava/lang/String; = "iGO"

.field public static final assets_to_install:[Ljava/lang/String;

.field public static final audio_mode:I = 0x0

.field public static background_shutdown_distance:I = 0x0

.field public static background_shutdown_timeout:I = 0x0

.field public static canvas_matrix_hack:I = 0x0

.field public static check_folders_after_rebuild:Z = false

.field public static check_for_dead_links:Z = false

.field public static check_gps_timestamp:Z = false

.field public static final contentzip:Ljava/lang/String; = "content.zip"

.field public static create_sdcard_dir:Z = false

.field public static dataDir:Ljava/lang/String; = null

.field public static final debug:Z = false

.field public static final def_SOUND_TIMEOUT:I = 0x5dc

.field public static final def_additional_assets:Ljava/lang/String; = ""

.field public static final def_android_muting_device:I = 0x2

.field public static def_background_navigation:Z = false

.field public static final def_bipbip_during_call:Z = true

.field public static final def_bipbip_timeout:I = 0x578

.field public static final def_bt_route:I = 0x10

.field public static final def_bt_sco_on:Z = false

.field public static final def_cache_size:I = 0x1312d00

.field public static def_callSystemExit:Z = false

.field public static def_customMissingContentMessage:Ljava/lang/String; = null

.field public static final def_disable_volume_changed_action:Z = false

.field public static final def_factory_reset:Ljava/lang/String;

.field public static final def_getdeviceid_trycount:I = 0x5

.field public static final def_has_physical_home_button:Z = true

.field public static final def_imei:Ljava/lang/String;

.field public static final def_interface_vfont_enabled:Z = false

.field public static final def_linked_root_list:Ljava/lang/String;

.field public static final def_location_log_filename:Ljava/lang/String; = "LocationManager"

.field public static final def_location_log_repeat:Z = true

.field public static final def_mediascanning_timeout:I = 0x4e20

.field public static def_no_zip_if_city_available:Z = false

.field public static def_notify_network_status:Z = false

.field public static final def_oldViewContactMethod:Z = false

.field public static final def_on_low_memory:I = 0xb71b00

.field public static def_paint_data_unavailable_timeout:I = 0x0

.field public static def_recheck_igo_folder_after_restart:Z = false

.field public static final def_register_functors:Z = true

.field public static final def_sensors_on:Z = false

.field public static final def_setup_audio_path:Z = false

.field public static final def_show_background_notification:Z = true

.field public static final def_speakerphone_on:Z = false

.field public static final def_start_on_boot:Z = false

.field public static final def_start_on_insert_sdcard:Z = true

.field public static final def_startengine_timeout:I = 0x1d4c0

.field public static final def_tablet:Z = false

.field public static final def_use_last_known_position:Z = false

.field public static def_wait_for_closing_igo:Z = false

.field public static def_wait_for_engine_shutdown:Z = false

.field public static final def_wait_for_gdbserver:I = 0xea60

.field public static final def_wait_for_sdcard_on_boot:I = 0x7530

.field public static default_latitude:D = 0.0

.field public static default_longitude:D = 0.0

.field public static final delete_old_solib:Z = true

.field public static final delete_tahoma:Z = true

.field public static final delete_tuttifrutti:Z = true

.field public static final destroy_with_activity:Z = false

.field public static dragprocesstime:I = 0x0

.field private static final egl_cfg:Ljava/lang/String; = "/system/lib/egl/egl.cfg"

.field private static final egl_cfg_missing_fallback:Ljava/lang/String; = "/system/lib/egl/libGLES_android.so"

.field private static final egl_display_index:I = 0x0

.field private static final egl_implementation_hardware:Z = true

.field private static final egl_variants:[Ljava/lang/String;

.field public static enableInsertContactWithNewApi:Z = false

.field public static final enable_navigateto_processer:Z = false

.field public static final extlist_lang:[Ljava/lang/String;

.field public static final extlist_license:[Ljava/lang/String;

.field public static final extlist_plugins:[Ljava/lang/String;

.field public static final extlist_voice:[Ljava/lang/String;

.field public static fourway_orientable_device:Z = false

.field public static fullscreen:Z = false

.field public static final gdb:Z = false

.field public static final getGpsMinTime:I = 0x3e7

.field public static getdeviceid_gemini:Z = false

.field public static final googleaddressdecoder:Z = false

.field public static gps_lost_timeout:I = 0x0

.field public static final gps_time_treshold:I = 0x57b12c00

.field public static horizontal_accuracy_treshold:I = 0x0

.field public static ignore_spoofed_keys:Z = false

.field public static final inAppShopEnabled:Z = true

.field public static final install_tahoma:Z = false

.field public static final install_timeout:I = 0xea60

.field public static final install_to_sd:Z = true

.field public static final install_tuttifrutti:Z = false

.field public static final isGooglePlay:Z = true

.field public static final is_synctool:Z = false

.field public static final is_toolbox:Z = false

.field public static final libName:Ljava/lang/String; = "igo_jni"

.field public static final licence_lock_hardcoded_to:Ljava/lang/String; = "android_id"

.field public static final licencing_validity_period:I = 0x1e

.field public static final licensezip:Ljava/lang/String; = "license.zip"

.field public static final link_to_sdcard_igo_dir:Ljava/lang/String; = "android_linked_root"

.field public static final load_systxt_from_sd:Z = false

.field public static location_gps:Z = false

.field public static location_log:Z = false

.field public static location_net:Z = false

.field public static location_nmea:Z = false

.field public static location_shiny:Z = false

.field public static lock_to_external_sd:Z = false

.field private static log_file_path_is_setup:Z = false

.field public static log_fps:I = 0x0

.field public static logcat_date:Z = false

.field public static logcat_file:Ljava/lang/String; = null

.field public static logcat_file_delay:I = 0x0

.field public static logcat_file_trigger:Ljava/lang/String; = null

.field public static logcat_level:I = 0x0

.field public static logcat_max_file_count:I = 0x0

.field public static logcat_max_file_size:I = 0x0

.field public static logcat_oslevel:I = 0x0

.field public static logcat_pid:Ljava/lang/String; = null

.field public static logcat_tag:Ljava/lang/String; = null

.field public static logcat_thread:Z = false

.field private static final logname:Ljava/lang/String; = "Config"

.field private static mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig; = null

.field public static memorywatcher_timeout_background:J = 0x0L

.field public static memorywatcher_timeout_foreground:I = 0x0

.field public static mouse_matrix_hack:I = 0x0

.field public static navigation_audio_content_type:I = 0x0

.field public static navigation_audio_stream:I = 0x0

.field public static navigation_audio_usage:I = 0x0

.field public static network_jelre_fanyalodunk_timeout:I = 0x0

.field public static orientationchange_timeout:I = 0x0

.field public static final oslangcodes_ini:Ljava/lang/String; = "content/config/oslangcodes.ini"

.field public static packageName:Ljava/lang/String; = null

.field public static final permission_contacts_is_critical:Z = false

.field public static final permission_location_is_critical:Z = true

.field public static final permission_microphone_is_critical:Z = false

.field public static final permission_phone_is_critical:Z = true

.field public static final permission_storage_is_critical:Z = true

.field public static playStorePublicKey:[B = null

.field public static final pluginszip:Ljava/lang/String; = "ui_plugins.zip"

.field public static publicKeyDecodeNeeded:Z = true

.field public static final resourceszip:Ljava/lang/String; = "resources.zip"

.field private static final sd_config_allowed:Z = false

.field public static final sd_full_on_install_is_fatal:Z = false

.field public static sdcardDir:Ljava/lang/String; = null

.field public static sdcardRoot:Ljava/lang/String; = null

.field public static final sdcard_on_notification_bar:Z = false

.field public static secondaryRootDir:Ljava/lang/String; = null

.field public static select_eglconfig_zeroalpha:Z = false

.field public static serverFolder:Ljava/lang/String; = null

.field public static serverStartDir:Ljava/lang/String; = null

.field public static silent_startup:Z = false

.field public static final start_on_GCoor:Z = false

.field private static final sysTxtName:Ljava/lang/String; = "sys.txt"

.field public static final ttszip:Ljava/lang/String; = "tts.zip"

.field public static update_denied_timeout_foreground:I = 0x0

.field public static upside_down_bug:Z = false

.field public static final useCustomLicensingPolicy:Z = false

.field public static useExternalNightModeManager:Z = false

.field public static final use_icu_libs:Z = true

.field public static final use_permission_contacts:Z = false

.field public static final use_permission_location:Z = true

.field public static final use_permission_microphone:Z = false

.field public static final use_permission_phone:Z = false

.field public static final use_permission_storage:Z = true

.field public static final usingOsDownloader:Z = false

.field public static ux_plugin_folder:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 56
    sget-object v0, Lcom/navngo/igo/javaclient/BuildConfig;->playStorePublicKey:[B

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->playStorePublicKey:[B

    const-string v0, ".lic"

    const-string v1, ".lyc"

    .line 110
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->extlist_license:[Ljava/lang/String;

    const-string v0, ".zip"

    const-string v1, ".gro"

    .line 111
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/navngo/igo/javaclient/Config;->extlist_lang:[Ljava/lang/String;

    .line 112
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/navngo/igo/javaclient/Config;->extlist_voice:[Ljava/lang/String;

    .line 113
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->extlist_plugins:[Ljava/lang/String;

    const-string v0, "data.zip"

    const-string v1, "data.gro"

    const-string v2, "branding.zip"

    const-string v3, "branding.gro"

    .line 115
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->assets_to_install:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 118
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    const/4 v1, 0x1

    .line 129
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->ignore_spoofed_keys:Z

    const/4 v2, 0x0

    .line 131
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->select_eglconfig_zeroalpha:Z

    const-string v3, "/system/lib/egl/libGLES_%s.so"

    const-string v4, "/system/lib/egl/libEGL_%s.so"

    const-string v5, "/system/lib/egl/libGLES_v1_CM_%s.so"

    const-string v6, "/system/lib/egl/libGLES_v2_%s.so"

    .line 136
    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/navngo/igo/javaclient/Config;->egl_variants:[Ljava/lang/String;

    .line 154
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->create_sdcard_dir:Z

    .line 155
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->check_folders_after_rebuild:Z

    .line 157
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->def_linked_root_list:Ljava/lang/String;

    const-string v3, "ux"

    .line 158
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    .line 159
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    .line 160
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    .line 161
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    .line 162
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_shiny:Z

    .line 163
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    .line 164
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    .line 169
    sput-wide v3, Lcom/navngo/igo/javaclient/Config;->default_latitude:D

    .line 170
    sput-wide v3, Lcom/navngo/igo/javaclient/Config;->default_longitude:D

    .line 194
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file:Ljava/lang/String;

    .line 195
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file_trigger:Ljava/lang/String;

    const-string v3, "navngo"

    .line 196
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    const/4 v3, 0x3

    .line 197
    sput v3, Lcom/navngo/igo/javaclient/Config;->logcat_level:I

    const/4 v4, 0x5

    .line 198
    sput v4, Lcom/navngo/igo/javaclient/Config;->logcat_oslevel:I

    .line 199
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->logcat_date:Z

    .line 200
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->logcat_thread:Z

    const-string v4, ": "

    .line 201
    sput-object v4, Lcom/navngo/igo/javaclient/Config;->logcat_pid:Ljava/lang/String;

    .line 202
    sput v2, Lcom/navngo/igo/javaclient/Config;->logcat_file_delay:I

    .line 203
    sput v2, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_size:I

    .line 204
    sput v2, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_count:I

    .line 209
    sput v2, Lcom/navngo/igo/javaclient/Config;->log_fps:I

    .line 210
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    .line 211
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->def_imei:Ljava/lang/String;

    .line 213
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->getdeviceid_gemini:Z

    const/16 v4, 0x7530

    .line 215
    sput v4, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_foreground:I

    const-wide/16 v5, -0x1

    .line 216
    sput-wide v5, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    const/16 v5, 0x1388

    .line 217
    sput v5, Lcom/navngo/igo/javaclient/Config;->update_denied_timeout_foreground:I

    const v5, 0x927c0

    .line 218
    sput v5, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    const/16 v5, 0x64

    .line 219
    sput v5, Lcom/navngo/igo/javaclient/Config;->background_shutdown_distance:I

    .line 228
    sput v2, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    .line 232
    sput v3, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    .line 237
    sput v3, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    const/16 v3, 0xc

    .line 238
    sput v3, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    .line 239
    sput v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    const/4 v3, 0x2

    .line 240
    sput v3, Lcom/navngo/igo/javaclient/Config;->android_audiofocus_gain_method:I

    .line 253
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->def_notify_network_status:Z

    const/16 v3, 0x14

    .line 256
    sput v3, Lcom/navngo/igo/javaclient/Config;->dragprocesstime:I

    .line 258
    sput v2, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    .line 259
    sput v4, Lcom/navngo/igo/javaclient/Config;->gps_lost_timeout:I

    .line 262
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->lock_to_external_sd:Z

    .line 265
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->enableInsertContactWithNewApi:Z

    .line 266
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->fourway_orientable_device:Z

    .line 267
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->upside_down_bug:Z

    .line 269
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->check_gps_timestamp:Z

    .line 270
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->def_background_navigation:Z

    .line 272
    sput v5, Lcom/navngo/igo/javaclient/Config;->horizontal_accuracy_treshold:I

    const/16 v3, 0xfa0

    .line 273
    sput v3, Lcom/navngo/igo/javaclient/Config;->orientationchange_timeout:I

    const/16 v3, 0xa

    .line 274
    sput v3, Lcom/navngo/igo/javaclient/Config;->def_paint_data_unavailable_timeout:I

    .line 276
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    .line 278
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->def_factory_reset:Ljava/lang/String;

    .line 279
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->def_callSystemExit:Z

    const-string v3, ""

    .line 281
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->def_customMissingContentMessage:Ljava/lang/String;

    .line 295
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->check_for_dead_links:Z

    const-string v4, "android"

    .line 297
    sput-object v4, Lcom/navngo/igo/javaclient/Config;->android_muting_device_name:Ljava/lang/String;

    .line 299
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->IMD_component:Ljava/lang/String;

    .line 300
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->IMD_category:Ljava/lang/String;

    .line 301
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->IMD_start_action:Ljava/lang/String;

    .line 302
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->IMD_stop_action:Ljava/lang/String;

    .line 303
    sput-object v3, Lcom/navngo/igo/javaclient/Config;->IMD_exit_action:Ljava/lang/String;

    .line 304
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->IMD_app_mute:Z

    .line 306
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->def_wait_for_closing_igo:Z

    .line 307
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->def_wait_for_engine_shutdown:Z

    .line 308
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->def_recheck_igo_folder_after_restart:Z

    .line 310
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->def_no_zip_if_city_available:Z

    .line 314
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->android_ssl_pinning:Z

    .line 315
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_trusted_certs:[Ljava/lang/String;

    .line 316
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    .line 317
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_key:Ljava/lang/String;

    .line 318
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_password:Ljava/lang/String;

    .line 320
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    .line 321
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_proxy_servers:[Ljava/lang/String;

    .line 323
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->androidNightModeChangeOnIntent:Z

    .line 324
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->useExternalNightModeManager:Z

    .line 464
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    .line 712
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->log_file_path_is_setup:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static UpdateCache()V
    .registers 12

    .line 545
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    if-nez v0, :cond_5

    return-void

    .line 549
    :cond_5
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    const-string v1, "gps"

    const-string v2, "location_gps"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    .line 550
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    const-string v2, "location_net"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    .line 551
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    const-string v2, "location_log"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    .line 552
    sget-wide v2, Lcom/navngo/igo/javaclient/Config;->default_latitude:D

    const-string v0, "default_latitude"

    invoke-static {v1, v0, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getDouble(Ljava/lang/String;Ljava/lang/String;D)D

    move-result-wide v2

    sput-wide v2, Lcom/navngo/igo/javaclient/Config;->default_latitude:D

    .line 553
    sget-wide v2, Lcom/navngo/igo/javaclient/Config;->default_longitude:D

    const-string v0, "default_longitude"

    invoke-static {v1, v0, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getDouble(Ljava/lang/String;Ljava/lang/String;D)D

    move-result-wide v2

    sput-wide v2, Lcom/navngo/igo/javaclient/Config;->default_longitude:D

    .line 554
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    const-string v2, "location_nmea"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    .line 555
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_shiny:Z

    const-string v2, "location_shiny"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_shiny:Z

    .line 556
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    const-string v2, "accuracy_workaround"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    const/4 v2, 0x1

    const-string v3, "Config"

    if-eqz v0, :cond_64

    .line 558
    sput-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    const-string v0, "Android accuracy_workaround enabled"

    .line 559
    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_69

    :cond_64
    const-string v0, "Android accuracy_workaround disabled"

    .line 562
    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    :goto_69
    sget v0, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    const-string v4, "network_jelre_fanyalodunk_timeout"

    invoke-static {v1, v4, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    const/4 v4, 0x0

    .line 565
    move-object v5, v4

    check-cast v5, Ljava/util/Locale;

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const-string v0, "network_jelre_fanyalodunk_timeout = %d"

    invoke-static {v4, v0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_gps_timestamp:Z

    const-string v5, "check_gps_timestamp"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_gps_timestamp:Z

    .line 569
    sget v0, Lcom/navngo/igo/javaclient/Config;->log_fps:I

    const-string v1, "debug"

    const-string v5, "log_fps"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->log_fps:I

    .line 570
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    const-string v5, "silent_startup"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    .line 572
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file:Ljava/lang/String;

    const-string v1, "android"

    const-string v5, "logcat_file"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file:Ljava/lang/String;

    .line 573
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file_trigger:Ljava/lang/String;

    const-string v5, "logcat_file_trigger"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_file_trigger:Ljava/lang/String;

    .line 574
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    const-string v5, "logcat_tag"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    .line 575
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->lock_to_external_sd:Z

    const-string v5, "lock_to_external_sd"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->lock_to_external_sd:Z

    .line 577
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_level:I

    const-string v5, "logcat_level"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->logcat_level:I

    .line 578
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_oslevel:I

    const-string v5, "logcat_oslevel"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->logcat_oslevel:I

    .line 579
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->logcat_date:Z

    const-string v5, "logcat_date"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->logcat_date:Z

    .line 580
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->logcat_thread:Z

    const-string v5, "logcat_thread"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->logcat_thread:Z

    const-string v0, "logcat_pid"

    .line 581
    invoke-static {v1, v0, v6}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_11e

    .line 582
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " ("

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "): "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_120

    :cond_11e
    const-string v0, ": "

    .line 583
    :goto_120
    sput-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_pid:Ljava/lang/String;

    .line 584
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_file_delay:I

    const-string v5, "logcat_file_delay"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->logcat_file_delay:I

    .line 585
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_size:I

    div-int/lit16 v0, v0, 0x400

    const-string v5, "logcat_max_file_size_in_kilobytes"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x400

    sput v0, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_size:I

    .line 586
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_count:I

    const-string v5, "logcat_max_file_count"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->logcat_max_file_count:I

    .line 587
    sget v0, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_foreground:I

    const-string v5, "memorywatcher_timeout_foreground"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_foreground:I

    .line 588
    sget-wide v7, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    const-string v0, "memorywatcher_timeout_background"

    invoke-static {v1, v0, v7, v8}, Lcom/navngo/igo/javaclient/Config;->getLong(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v7

    sput-wide v7, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    .line 589
    sget v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    const-string v5, "background_shutdown_timeout"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    .line 590
    sget v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_distance:I

    const-string v5, "background_shutdown_distance"

    invoke-static {v1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_distance:I

    .line 591
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v7, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v7, "canvas_matrix_hack"

    invoke-static {v1, v7, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v7, "none"

    .line 592
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    const/4 v9, 0x3

    const/4 v10, 0x2

    const-string v11, "invert"

    if-eqz v8, :cond_194

    .line 593
    sput v6, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    goto :goto_1ca

    :cond_194
    const-string v8, "null"

    .line 594
    invoke-virtual {v0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_19f

    .line 595
    sput v2, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    goto :goto_1ca

    :cond_19f
    const-string v2, "identity"

    .line 596
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1aa

    .line 597
    sput v10, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    goto :goto_1ca

    .line 598
    :cond_1aa
    invoke-virtual {v0, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b3

    .line 599
    sput v9, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    goto :goto_1ca

    :cond_1b3
    const-string v2, "invert-negoffset"

    .line 600
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1bf

    const/4 v0, 0x4

    .line 601
    sput v0, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    goto :goto_1ca

    :cond_1bf
    const-string v2, "invert-zerooffset"

    .line 602
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1ca

    const/4 v0, 0x5

    .line 603
    sput v0, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    .line 605
    :cond_1ca
    :goto_1ca
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "mouse_matrix_hack"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 606
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1ea

    .line 607
    sput v6, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    goto :goto_1f2

    .line 608
    :cond_1ea
    invoke-virtual {v0, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f2

    .line 609
    sput v9, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    .line 611
    :cond_1f2
    :goto_1f2
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    const-string v2, "navigation_audio_stream"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    .line 612
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    const-string v2, "navigation_audio_usage"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    .line 613
    sget v0, Lcom/navngo/igo/javaclient/Config;->dragprocesstime:I

    const-string v2, "dragprocesstime"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->dragprocesstime:I

    .line 614
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->upside_down_bug:Z

    const-string v2, "upside_down_bug"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->upside_down_bug:Z

    const-string v0, "device"

    const-string v2, "type"

    .line 615
    invoke-static {v0, v2, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "moz"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const-string v2, "fourway_orientable_device"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->fourway_orientable_device:Z

    .line 616
    sget v0, Lcom/navngo/igo/javaclient/Config;->orientationchange_timeout:I

    const-string v2, "orientationchange_timeout"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->orientationchange_timeout:I

    .line 617
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    const-string v2, "fullscreen"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    .line 618
    sget v0, Lcom/navngo/igo/javaclient/Config;->update_denied_timeout_foreground:I

    const-string v2, "update_denied_timeout_foreground"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->update_denied_timeout_foreground:I

    .line 619
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->getdeviceid_gemini:Z

    const-string v2, "getdeviceid_gemini"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->getdeviceid_gemini:Z

    .line 620
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_for_dead_links:Z

    const-string v2, "check_for_dead_links"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_for_dead_links:Z

    .line 621
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->create_sdcard_dir:Z

    const-string v2, "create_sdcard_dir"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->create_sdcard_dir:Z

    .line 622
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_folders_after_rebuild:Z

    const-string v2, "check_folders_after_rebuild"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_folders_after_rebuild:Z

    .line 623
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->ignore_spoofed_keys:Z

    const-string v2, "ignore_spoofed_keys"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->ignore_spoofed_keys:Z

    .line 625
    sget v0, Lcom/navngo/igo/javaclient/Config;->android_audiofocus_gain_method:I

    const-string v1, "sound"

    const-string v2, "android_audiofocus_gain_method"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/Config;->android_audiofocus_gain_method:I

    .line 627
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    const-string v2, "folders"

    const-string v7, "sdcardpath"

    invoke-static {v2, v7, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    .line 628
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const-string v7, "linked_root"

    invoke-static {v2, v7, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const-string v0, "data"

    .line 629
    invoke-static {v2, v0, v4}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->dataDir:Ljava/lang/String;

    .line 630
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const-string v4, "secondary_root"

    invoke-static {v2, v4, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->secondaryRootDir:Ljava/lang/String;

    .line 631
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    const-string v4, "ux_folder"

    invoke-static {v2, v4, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    const-string v0, "mkdirs"

    .line 632
    invoke-static {v2, v0, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 633
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_30b

    .line 634
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 635
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2d6

    goto :goto_30b

    .line 637
    :cond_2d6
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2f1

    .line 638
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "non-directory:mkdirs="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30b

    .line 639
    :cond_2f1
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_30b

    .line 640
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Directory created: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 645
    :cond_30b
    :goto_30b
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->android_muting_device_name:Ljava/lang/String;

    const-string v2, "android_muting_device_name"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_muting_device_name:Ljava/lang/String;

    .line 648
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_component:Ljava/lang/String;

    const-string v1, "intent_muting_device"

    const-string v2, "component"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_component:Ljava/lang/String;

    .line 649
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_category:Ljava/lang/String;

    const-string v2, "category"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_category:Ljava/lang/String;

    .line 650
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_start_action:Ljava/lang/String;

    const-string v2, "start_action"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_start_action:Ljava/lang/String;

    .line 651
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_stop_action:Ljava/lang/String;

    const-string v2, "stop_action"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_stop_action:Ljava/lang/String;

    .line 652
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_exit_action:Ljava/lang/String;

    const-string v2, "exit_action"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_exit_action:Ljava/lang/String;

    .line 653
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->IMD_app_mute:Z

    const-string v2, "app_mute"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->IMD_app_mute:Z

    .line 656
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_pinning:Z

    const-string v1, "android.ssl"

    const-string v2, "pinning_enabled"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_pinning:Z

    .line 657
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_key:Ljava/lang/String;

    const-string v2, "client_key"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_key:Ljava/lang/String;

    .line 658
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_password:Ljava/lang/String;

    const-string v2, "client_password"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_password:Ljava/lang/String;

    .line 659
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    const-string v2, "client_cert"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->android_ssl_client_cert:Ljava/lang/String;

    const-string v0, "trusted_cert.size"

    .line 660
    invoke-static {v1, v0, v6}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    if-lez v0, :cond_3b1

    .line 662
    new-array v2, v0, [Ljava/lang/String;

    sput-object v2, Lcom/navngo/igo/javaclient/Config;->android_ssl_trusted_certs:[Ljava/lang/String;

    const/4 v2, 0x0

    :goto_38a
    if-ge v2, v0, :cond_3b1

    .line 664
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->android_ssl_trusted_certs:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "trusted_cert["

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "]"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/navngo/igo/javaclient/Config;->android_ssl_trusted_certs:[Ljava/lang/String;

    aget-object v7, v7, v2

    invoke-static {v1, v4, v7}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_38a

    :cond_3b1
    const-string v0, "android.proxy"

    const-string v1, "rule.size"

    .line 667
    invoke-static {v0, v1, v6}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_406

    .line 669
    new-array v2, v1, [Ljava/util/regex/Pattern;

    sput-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    .line 670
    new-array v2, v1, [Ljava/lang/String;

    sput-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_servers:[Ljava/lang/String;

    :goto_3c3
    if-ge v6, v1, :cond_406

    .line 672
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_patterns:[Ljava/util/regex/Pattern;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rule["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "].pattern"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v10}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    aput-object v3, v2, v6

    .line 673
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->android_proxy_servers:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "].server"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_3c3

    .line 678
    :cond_406
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->select_eglconfig_zeroalpha:Z

    const-string v1, "rawdisplay"

    const-string v2, "select_eglconfig_zeroalpha"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/navngo/igo/javaclient/Config;->select_eglconfig_zeroalpha:Z

    return-void
.end method

.method public static addConfig(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 467
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/navngo/igo/javaclient/LayeredConfig;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;
    .registers 6

    .line 829
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    const-string v1, ".ini"

    const-string v2, "Config"

    if-nez v0, :cond_1f

    .line 831
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "trying to use device config by "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    :cond_1f
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_54

    .line 834
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config/devices/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object p0

    if-eqz p0, :cond_55

    .line 836
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "using device config by : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_55

    :cond_54
    const/4 p0, 0x0

    :cond_55
    :goto_55
    return-object p0
.end method

.method private static createSDCardDir()V
    .registers 3

    .line 684
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->create_sdcard_dir:Z

    if-eqz v0, :cond_49

    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    if-eqz v0, :cond_49

    .line 685
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 686
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_49

    .line 687
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "creating sdcardDir: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Config"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_49

    .line 689
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "failed to create sdcardDir: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_49
    return-void
.end method

.method public static detectCharsetFromBOM(Ljava/io/BufferedInputStream;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x20

    .line 411
    invoke-virtual {p0, v0}, Ljava/io/BufferedInputStream;->mark(I)V

    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 413
    invoke-virtual {p0, v1, v2, v0}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v0

    const-string v3, "UTF-7"

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-ge v0, v6, :cond_15

    goto/16 :goto_10f

    :cond_15
    aget-byte v7, v1, v2

    const/4 v8, -0x1

    const/4 v9, -0x2

    const/4 v10, 0x1

    if-ne v7, v9, :cond_25

    aget-byte v7, v1, v10

    if-ne v7, v8, :cond_25

    const-string v3, "UTF-16BE"

    :goto_22
    const/4 v4, 0x2

    goto/16 :goto_111

    :cond_25
    aget-byte v7, v1, v2

    if-ne v7, v8, :cond_30

    aget-byte v7, v1, v10

    if-ne v7, v9, :cond_30

    const-string v3, "UTF-16LE"

    goto :goto_22

    :cond_30
    if-ge v0, v5, :cond_34

    goto/16 :goto_10f

    :cond_34
    aget-byte v7, v1, v2

    const/16 v11, -0x11

    if-ne v7, v11, :cond_4b

    aget-byte v7, v1, v10

    const/16 v11, -0x45

    if-ne v7, v11, :cond_4b

    aget-byte v7, v1, v6

    const/16 v11, -0x41

    if-ne v7, v11, :cond_4b

    const-string v3, "UTF-8"

    :goto_48
    const/4 v4, 0x3

    goto/16 :goto_111

    :cond_4b
    aget-byte v7, v1, v2

    const/4 v11, -0x5

    if-ne v7, v11, :cond_5f

    aget-byte v7, v1, v10

    const/16 v11, -0x12

    if-ne v7, v11, :cond_5f

    aget-byte v7, v1, v6

    const/16 v11, 0x28

    if-ne v7, v11, :cond_5f

    const-string v3, "BOCU-1"

    goto :goto_48

    :cond_5f
    aget-byte v7, v1, v2

    const/16 v11, 0xe

    if-ne v7, v11, :cond_70

    aget-byte v7, v1, v10

    if-ne v7, v9, :cond_70

    aget-byte v7, v1, v6

    if-ne v7, v8, :cond_70

    const-string v3, "SCSU"

    goto :goto_48

    :cond_70
    if-ge v0, v4, :cond_74

    goto/16 :goto_10f

    :cond_74
    aget-byte v7, v1, v2

    if-nez v7, :cond_88

    aget-byte v7, v1, v10

    if-nez v7, :cond_88

    aget-byte v7, v1, v6

    if-ne v7, v9, :cond_88

    aget-byte v7, v1, v5

    if-ne v7, v8, :cond_88

    const-string v3, "UTF-32BE"

    goto/16 :goto_111

    :cond_88
    aget-byte v7, v1, v2

    if-ne v7, v8, :cond_9c

    aget-byte v7, v1, v10

    if-ne v7, v9, :cond_9c

    aget-byte v7, v1, v6

    if-nez v7, :cond_9c

    aget-byte v7, v1, v5

    if-nez v7, :cond_9c

    const-string v3, "UTF-32LE"

    goto/16 :goto_111

    :cond_9c
    aget-byte v7, v1, v2

    const/16 v8, -0x7c

    if-ne v7, v8, :cond_b7

    aget-byte v7, v1, v10

    const/16 v8, 0x31

    if-ne v7, v8, :cond_b7

    aget-byte v7, v1, v6

    const/16 v8, -0x6b

    if-ne v7, v8, :cond_b7

    aget-byte v7, v1, v5

    const/16 v8, 0x33

    if-ne v7, v8, :cond_b7

    const-string v3, "GB18030"

    goto :goto_111

    :cond_b7
    aget-byte v7, v1, v2

    const/16 v8, 0x76

    const/16 v9, 0x2f

    const/16 v11, 0x2b

    if-ne v7, v11, :cond_da

    aget-byte v7, v1, v10

    if-ne v7, v9, :cond_da

    aget-byte v7, v1, v6

    if-ne v7, v8, :cond_da

    aget-byte v7, v1, v5

    const/16 v12, 0x38

    if-ne v7, v12, :cond_da

    const/4 v5, 0x5

    if-lt v0, v5, :cond_111

    aget-byte v0, v1, v4

    const/16 v6, 0x2d

    if-ne v0, v6, :cond_111

    const/4 v4, 0x5

    goto :goto_111

    :cond_da
    aget-byte v0, v1, v2

    if-ne v0, v11, :cond_ed

    aget-byte v0, v1, v10

    if-ne v0, v9, :cond_ed

    aget-byte v0, v1, v6

    if-ne v0, v8, :cond_ed

    aget-byte v0, v1, v5

    const/16 v7, 0x39

    if-ne v0, v7, :cond_ed

    goto :goto_111

    :cond_ed
    aget-byte v0, v1, v2

    if-ne v0, v11, :cond_fe

    aget-byte v0, v1, v10

    if-ne v0, v9, :cond_fe

    aget-byte v0, v1, v6

    if-ne v0, v8, :cond_fe

    aget-byte v0, v1, v5

    if-ne v0, v11, :cond_fe

    goto :goto_111

    :cond_fe
    aget-byte v0, v1, v2

    if-ne v0, v11, :cond_10f

    aget-byte v0, v1, v10

    if-ne v0, v9, :cond_10f

    aget-byte v0, v1, v6

    if-ne v0, v8, :cond_10f

    aget-byte v0, v1, v5

    if-ne v0, v9, :cond_10f

    goto :goto_111

    :cond_10f
    :goto_10f
    move-object v3, p1

    const/4 v4, 0x0

    .line 433
    :cond_111
    :goto_111
    invoke-static {v3}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_119

    const/4 v4, 0x0

    goto :goto_11a

    :cond_119
    move-object p1, v3

    :goto_11a
    if-eqz p2, :cond_150

    if-nez v4, :cond_150

    .line 436
    invoke-static {}, Ljava/nio/charset/Charset;->availableCharsets()Ljava/util/SortedMap;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_12a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_150

    .line 437
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 438
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    const-string v5, "\ufeff"

    invoke-virtual {v3, v5}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 439
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 440
    invoke-static {v1, v2, v5}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->compareTo(Ljava/nio/ByteBuffer;)I

    move-result v3

    if-nez v3, :cond_12a

    move-object p1, v0

    move v4, v5

    .line 448
    :cond_150
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    if-lez v4, :cond_158

    .line 450
    invoke-virtual {p0, v1, v2, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    :cond_158
    return-object p1
.end method

.method public static find_libEGL()Ljava/lang/String;
    .registers 16

    const-string v0, "/system/lib/egl/libGLES_android.so"

    const-string v1, "/system/lib/egl/egl.cfg"

    const-string v2, "Config"

    .line 1055
    :try_start_6
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_18

    const-string v1, "find_libEGL:egl.cfg not exists"

    .line 1056
    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_eb

    :cond_18
    const-string v3, "^\\s*(\\d+)\\s+(\\d+)\\s+(\\S+)\\s*$"

    .line 1060
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 1061
    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "(?s)\\n"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_2b
    if-ge v6, v4, :cond_e2

    aget-object v7, v1, v6

    .line 1062
    invoke-virtual {v3, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 1063
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v9

    if-nez v9, :cond_4f

    .line 1064
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "find_libEGL: comment line:     "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_de

    :cond_4f
    const/4 v9, 0x1

    .line 1067
    invoke-virtual {v8, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v11, 0x2

    .line 1068
    invoke-virtual {v8, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    const/4 v12, 0x3

    .line 1069
    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    if-nez v10, :cond_ca

    if-eq v11, v9, :cond_6b

    goto :goto_ca

    .line 1074
    :cond_6b
    sget-object v10, Lcom/navngo/igo/javaclient/Config;->egl_variants:[Ljava/lang/String;

    array-length v11, v10

    const/4 v12, 0x0

    :goto_6f
    if-ge v12, v11, :cond_de

    aget-object v13, v10, v12

    .line 1075
    new-instance v14, Ljava/io/File;

    new-array v15, v9, [Ljava/lang/Object;

    aput-object v8, v15, v5

    invoke-static {v13, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v14, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1076
    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    .line 1077
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_b3

    .line 1078
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find_libEGL: using line:        "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1079
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find_libEGL: using lib: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-object v13

    .line 1082
    :cond_b3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "find_libEGL: not found: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v2, v13}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_6f

    .line 1071
    :cond_ca
    :goto_ca
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "find_libEGL: non-matching line: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_de
    :goto_de
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_2b

    :cond_e2
    const-string v0, "libEGL.so"
    :try_end_e4
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_e4} :catch_e5

    goto :goto_eb

    :catch_e5
    move-exception v1

    const-string v3, "find_libEGL:egl.cfg not found"

    .line 1089
    invoke-static {v2, v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1092
    :goto_eb
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find_libEGL: better then nothing: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getAliasesIni(Z)Ljava/io/BufferedReader;
    .registers 10

    const-string v0, "Config"

    .line 733
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_c

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    goto :goto_e

    :cond_c
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    :goto_e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "data.zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz p0, :cond_35

    .line 740
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 741
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_35

    :try_start_2e
    const-string v3, "data_zip"

    .line 743
    invoke-static {p0, v3, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_33} :catch_34

    goto :goto_35

    :catch_34
    return-object v2

    .line 750
    :cond_35
    :goto_35
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_41

    return-object v2

    .line 755
    :cond_41
    :try_start_41
    new-instance p0, Ljava/util/zip/ZipFile;

    invoke-direct {p0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_46} :catch_b6
    .catchall {:try_start_41 .. :try_end_46} :catchall_b3

    :try_start_46
    const-string v1, "config/devices/!aliases.ini"

    .line 762
    invoke-virtual {p0, v1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v1

    if-eqz v1, :cond_a2

    .line 765
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v4, 0x400

    new-array v4, v4, [B

    .line 767
    invoke-virtual {p0, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_5b} :catch_b0
    .catchall {:try_start_46 .. :try_end_5b} :catchall_ae

    .line 768
    :try_start_5b
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 769
    invoke-static {v5}, Lcom/navngo/igo/javaclient/utils/EncodingDetector;->detect(Ljava/io/BufferedInputStream;)Ljava/lang/String;

    move-result-object v6

    .line 770
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getAliasesIni(): !aliases.ini detected encoding:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    :goto_78
    invoke-virtual {v5, v4}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_84

    const/4 v8, 0x0

    .line 773
    invoke-virtual {v3, v4, v8, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_78

    .line 775
    :cond_84
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 776
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-direct {v7, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v7, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_97} :catch_a0
    .catchall {:try_start_5b .. :try_end_97} :catchall_dc

    if-eqz v1, :cond_9c

    .line 785
    :try_start_99
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 788
    :cond_9c
    invoke-virtual {p0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9f} :catch_9f

    :catch_9f
    return-object v4

    :catch_a0
    move-exception v3

    goto :goto_c0

    :cond_a2
    :try_start_a2
    const-string v1, "getAliasesIni(): !aliases.ini not found"

    .line 778
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_a7} :catch_b0
    .catchall {:try_start_a2 .. :try_end_a7} :catchall_ae

    .line 788
    :try_start_a7
    invoke-virtual {p0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_aa} :catch_ac

    move-object p0, v2

    goto :goto_d4

    :catch_ac
    move-exception p0

    goto :goto_d4

    :catchall_ae
    move-exception v0

    goto :goto_de

    :catch_b0
    move-exception v3

    move-object v1, v2

    goto :goto_c0

    :catchall_b3
    move-exception v0

    move-object p0, v2

    goto :goto_de

    :catch_b6
    move-exception p0

    :try_start_b7
    const-string v1, "failed to load data.zip: "

    .line 757
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_bc
    .catch Ljava/lang/Exception; {:try_start_b7 .. :try_end_bc} :catch_bd
    .catchall {:try_start_b7 .. :try_end_bc} :catchall_b3

    return-object v2

    :catch_bd
    move-exception v3

    move-object p0, v2

    move-object v1, p0

    .line 781
    :goto_c0
    :try_start_c0
    new-instance v4, Ljava/io/IOException;

    invoke-virtual {v3}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_c9
    .catchall {:try_start_c0 .. :try_end_c9} :catchall_dc

    if-eqz v1, :cond_ce

    .line 785
    :try_start_cb
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_ce
    if-eqz p0, :cond_d3

    .line 788
    invoke-virtual {p0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_d3
    .catch Ljava/io/IOException; {:try_start_cb .. :try_end_d3} :catch_d3

    :catch_d3
    :cond_d3
    move-object p0, v4

    :goto_d4
    if-eqz p0, :cond_db

    const-string v1, "getAliasesIni(): "

    .line 796
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_db
    return-object v2

    :catchall_dc
    move-exception v0

    move-object v2, v1

    :goto_de
    if-eqz v2, :cond_e3

    .line 785
    :try_start_e0
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_e3
    if-eqz p0, :cond_e8

    .line 788
    invoke-virtual {p0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_e8
    .catch Ljava/io/IOException; {:try_start_e0 .. :try_end_e8} :catch_e8

    .line 793
    :catch_e8
    :cond_e8
    throw v0
.end method

.method public static getBool(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 4

    .line 1097
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-virtual {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static getDeviceConfig(Z)Ljava/io/BufferedReader;
    .registers 11

    const-string v0, "type"

    const-string v1, "device"

    .line 844
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_e

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    goto :goto_10

    :cond_e
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    :goto_10
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "data.zip"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "Config"

    if-eqz p0, :cond_4e

    .line 851
    sget-object v5, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v5}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 853
    :try_start_27
    new-instance v6, Ljava/util/zip/ZipFile;

    invoke-direct {v6, v2}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2c} :catch_2d

    goto :goto_4f

    :catch_2d
    move-exception v6

    .line 855
    instance-of v7, v6, Ljava/util/zip/ZipException;

    if-eqz v7, :cond_38

    const-string v7, "data.zip is corrupted, trying to restore "

    .line 856
    invoke-static {v4, v7, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_47

    .line 857
    :cond_38
    instance-of v7, v6, Ljava/io/FileNotFoundException;

    if-eqz v7, :cond_42

    const-string v6, "creating data_zip"

    .line 859
    invoke-static {v4, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_47

    :cond_42
    const-string v7, "unhandled exception: "

    .line 861
    invoke-static {v4, v7, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_47
    :try_start_47
    const-string v6, "data_zip"

    .line 864
    invoke-static {v5, v6, v2}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    return-object v3

    :cond_4e
    :goto_4e
    move-object v6, v3

    .line 871
    :goto_4f
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5b

    return-object v3

    :cond_5b
    if-nez v6, :cond_73

    .line 878
    :try_start_5d
    new-instance v5, Ljava/util/zip/ZipFile;

    invoke-direct {v5, v2}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_62} :catch_67
    .catchall {:try_start_5d .. :try_end_62} :catchall_64

    move-object v6, v5

    goto :goto_73

    :catchall_64
    move-exception p0

    goto/16 :goto_18b

    :catch_67
    move-exception p0

    :try_start_68
    const-string v0, "failed to load data.zip: "

    .line 880
    invoke-static {v4, v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_6d} :catch_16b
    .catchall {:try_start_68 .. :try_end_6d} :catchall_64

    if-eqz v6, :cond_72

    .line 948
    :try_start_6f
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_6f .. :try_end_72} :catch_72

    :catch_72
    :cond_72
    return-object v3

    .line 896
    :cond_73
    :goto_73
    :try_start_73
    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/navngo/igo/javaclient/Config;->checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7d} :catch_16b
    .catchall {:try_start_73 .. :try_end_7d} :catchall_64

    const-string v5, ""

    const-string v7, "aliases"

    if-nez v2, :cond_ba

    .line 900
    :try_start_83
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Config;->loadAliasesIni(Z)V

    .line 901
    sget-object p0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v7, p0, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 902
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "aliases loaded, Build.DEVICE:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v9, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " device:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_ba

    .line 904
    invoke-static {v6, p0}, Lcom/navngo/igo/javaclient/Config;->checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    :cond_ba
    const/4 p0, 0x0

    if-nez v2, :cond_fd

    const-string v8, "devtype_fallback_to_model"

    .line 908
    invoke-static {v1, v8, p0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_fd

    .line 909
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/navngo/igo/javaclient/Config;->checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 910
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "devtype_fallback_to_model enabled, Build.MODEL:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v2, :cond_fd

    .line 912
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 913
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_fd

    .line 914
    invoke-static {v6, v0}, Lcom/navngo/igo/javaclient/Config;->checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    :cond_fd
    if-nez v2, :cond_105

    const-string v0, "default_android"

    .line 921
    invoke-static {v6, v0}, Lcom/navngo/igo/javaclient/Config;->checkDeviceIni(Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    :cond_105
    if-eqz v2, :cond_15c

    .line 925
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 927
    invoke-virtual {v6, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_114
    .catch Ljava/lang/Exception; {:try_start_83 .. :try_end_114} :catch_16b
    .catchall {:try_start_83 .. :try_end_114} :catchall_64

    .line 928
    :try_start_114
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 929
    invoke-static {v5}, Lcom/navngo/igo/javaclient/utils/EncodingDetector;->detect(Ljava/io/BufferedInputStream;)Ljava/lang/String;

    move-result-object v7

    .line 930
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getDeviceConfig(): device ini detected encoding:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 932
    :goto_131
    invoke-virtual {v5, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_13c

    .line 933
    invoke-virtual {v0, v1, p0, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_131

    .line 935
    :cond_13c
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 936
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v5, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_14f
    .catch Ljava/lang/Exception; {:try_start_114 .. :try_end_14f} :catch_15a
    .catchall {:try_start_114 .. :try_end_14f} :catchall_189

    if-eqz v2, :cond_154

    .line 945
    :try_start_151
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_154
    if-eqz v6, :cond_159

    .line 948
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_159
    .catch Ljava/io/IOException; {:try_start_151 .. :try_end_159} :catch_159

    :catch_159
    :cond_159
    return-object v0

    :catch_15a
    move-exception p0

    goto :goto_16d

    :cond_15c
    :try_start_15c
    const-string p0, "getDeviceConfig(): device config not found"

    .line 938
    invoke-static {v4, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_161
    .catch Ljava/lang/Exception; {:try_start_15c .. :try_end_161} :catch_16b
    .catchall {:try_start_15c .. :try_end_161} :catchall_64

    if-eqz v6, :cond_169

    .line 948
    :try_start_163
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_166
    .catch Ljava/io/IOException; {:try_start_163 .. :try_end_166} :catch_167

    goto :goto_169

    :catch_167
    move-exception p0

    goto :goto_181

    :cond_169
    :goto_169
    move-object p0, v3

    goto :goto_181

    :catch_16b
    move-exception p0

    move-object v2, v3

    .line 941
    :goto_16d
    :try_start_16d
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_176
    .catchall {:try_start_16d .. :try_end_176} :catchall_189

    if-eqz v2, :cond_17b

    .line 945
    :try_start_178
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_17b
    if-eqz v6, :cond_180

    .line 948
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_180
    .catch Ljava/io/IOException; {:try_start_178 .. :try_end_180} :catch_180

    :catch_180
    :cond_180
    move-object p0, v0

    :goto_181
    if-eqz p0, :cond_188

    const-string v0, "getDeviceConfig(): "

    .line 956
    invoke-static {v4, v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_188
    return-object v3

    :catchall_189
    move-exception p0

    move-object v3, v2

    :goto_18b
    if-eqz v3, :cond_190

    .line 945
    :try_start_18d
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_190
    if-eqz v6, :cond_195

    .line 948
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_195
    .catch Ljava/io/IOException; {:try_start_18d .. :try_end_195} :catch_195

    .line 953
    :catch_195
    :cond_195
    throw p0
.end method

.method public static getDouble(Ljava/lang/String;Ljava/lang/String;D)D
    .registers 5

    .line 1113
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/LayeredConfig;->getDouble(Ljava/lang/String;Ljava/lang/String;D)D

    move-result-wide p0

    return-wide p0
.end method

.method public static getInt(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 4

    .line 1101
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-virtual {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getLong(Ljava/lang/String;Ljava/lang/String;J)J
    .registers 5

    .line 1109
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/LayeredConfig;->getLong(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 1105
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-virtual {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static initialize()V
    .registers 3

    const-string v0, "Config"

    const-string v1, "initialize"

    .line 715
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 717
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->createSDCardDir()V

    .line 718
    invoke-static {}, Lcom/navngo/igo/javaclient/RootPathDetector;->detect()V

    .line 719
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->loadConfigFromSd()V

    .line 720
    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    const/4 v1, 0x1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    sput-boolean v1, Lcom/navngo/igo/javaclient/Config;->log_file_path_is_setup:Z

    .line 722
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    const-string v1, "initialize done"

    .line 723
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static isLogFilePathSetup()Z
    .registers 1

    .line 727
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->log_file_path_is_setup:Z

    return v0
.end method

.method private static loadAliasesIni(Z)V
    .registers 6

    const-string v0, ""

    const-string v1, "Config"

    const/4 v2, 0x0

    .line 805
    :try_start_5
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Config;->getAliasesIni(Z)Ljava/io/BufferedReader;

    move-result-object v2

    if-eqz v2, :cond_39

    .line 807
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_15

    const-string p0, "iGO.apk#"

    goto :goto_28

    .line 809
    :cond_15
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "config.zip#"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_28
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "!aliases.ini"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x442

    .line 807
    invoke-static {p0, v2, v3}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/BufferedReader;I)V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_39} :catch_4b
    .catchall {:try_start_5 .. :try_end_39} :catchall_3f

    :cond_39
    if-eqz v2, :cond_56

    .line 819
    :try_start_3b
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_3e} :catch_52

    goto :goto_56

    :catchall_3f
    move-exception p0

    if-eqz v2, :cond_4a

    :try_start_42
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_46

    goto :goto_4a

    :catch_46
    move-exception v2

    .line 821
    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 824
    :cond_4a
    :goto_4a
    throw p0

    :catch_4b
    nop

    if-eqz v2, :cond_56

    .line 819
    :try_start_4e
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_56

    :catch_52
    move-exception p0

    .line 821
    invoke-static {v1, v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_56
    :goto_56
    return-void
.end method

.method private static loadConfig(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 456
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 458
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 461
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {p0, v1, p1}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/InputStream;I)V

    return-void

    .line 459
    :cond_14
    new-instance p1, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static loadConfig(Ljava/lang/String;Ljava/io/BufferedReader;I)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "^\\s*(?:;.*)?$"

    .line 498
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v1, "^\\s*([^=]*)\\s*=\\s*\"?([^\"]*)\"?\\s*$"

    .line 499
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "^\\s*\\[\\s*(.*?)\\s*\\]\\s*$"

    .line 500
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    const-string v3, "(^!include:)(\\S*[\\\\\\/])(\\S*\\.ini)$"

    .line 501
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 506
    sget-object v4, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    if-nez v4, :cond_23

    .line 507
    new-instance v4, Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-direct {v4}, Lcom/navngo/igo/javaclient/LayeredConfig;-><init>()V

    sput-object v4, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    :cond_23
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v11, v5

    .line 510
    :goto_26
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2d

    return-void

    :cond_2d
    const/4 v6, 0x1

    add-int/2addr v4, v6

    .line 514
    invoke-virtual {v3, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 515
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_48

    const/4 v5, 0x3

    .line 516
    invoke-virtual {v7, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 517
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    .line 518
    invoke-static {v5, p2}, Lcom/navngo/igo/javaclient/Config;->loadConfigFromDataZip(Ljava/lang/String;I)V

    goto :goto_26

    .line 521
    :cond_48
    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_53

    goto :goto_26

    .line 523
    :cond_53
    invoke-virtual {v2, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 524
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_68

    .line 525
    invoke-virtual {v7, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 526
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    goto :goto_26

    .line 529
    :cond_68
    invoke-virtual {v1, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 530
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_8a

    .line 531
    invoke-virtual {v7, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 532
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const/4 v5, 0x2

    .line 533
    invoke-virtual {v7, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 539
    sget-object v5, Lcom/navngo/igo/javaclient/Config;->mLayeredConfig:Lcom/navngo/igo/javaclient/LayeredConfig;

    move v6, p2

    move-object v7, v11

    move-object v10, p0

    invoke-virtual/range {v5 .. v10}, Lcom/navngo/igo/javaclient/LayeredConfig;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_26

    .line 535
    :cond_8a
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bad line: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Config"

    invoke-static {v6, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_26
.end method

.method private static loadConfig(Ljava/lang/String;Ljava/io/InputStream;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 471
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const-string p1, "UTF-8"

    const/4 v1, 0x0

    .line 472
    invoke-static {v0, p1, v1}, Lcom/navngo/igo/javaclient/Config;->detectCharsetFromBOM(Ljava/io/BufferedInputStream;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 473
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Loading config; filename=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", charset=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Config"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 477
    :try_start_30
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 p1, 0x2710

    invoke-direct {v2, v3, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_3c
    .catchall {:try_start_30 .. :try_end_3c} :catchall_46

    .line 478
    :try_start_3c
    invoke-static {p0, v2, p2}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/BufferedReader;I)V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_43

    .line 482
    :try_start_3f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_42} :catch_42

    :catch_42
    return-void

    :catchall_43
    move-exception p0

    move-object v1, v2

    goto :goto_47

    :catchall_46
    move-exception p0

    :goto_47
    if-eqz v1, :cond_4c

    :try_start_49
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_4c

    .line 487
    :catch_4c
    :cond_4c
    throw p0
.end method

.method public static loadConfigFromApk()V
    .registers 4

    const-string v0, "sys.txt"

    .line 335
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/navngo/igo/javaclient/Config;->packageName:Ljava/lang/String;

    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    .line 337
    sput-object v1, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    .line 340
    :try_start_29
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    const/16 v2, 0xa

    if-eqz v1, :cond_5c

    .line 341
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;I)V

    goto :goto_6d

    :cond_5c
    const-string v0, "iGO.apk#sys.txt"

    .line 343
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v3, Lcom/navngo/igo/javaclient/R$raw;->sys:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/InputStream;I)V

    .line 345
    :goto_6d
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->UpdateCache()V
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_70} :catch_71

    goto :goto_79

    :catch_71
    move-exception v0

    const-string v1, "Config"

    const-string v2, "Exception when loading sys.txt"

    .line 347
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_79
    return-void
.end method

.method private static loadConfigFromDataZip(Ljava/lang/String;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Config"

    .line 352
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "data.zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 355
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_60

    .line 358
    :try_start_20
    new-instance v2, Ljava/util/zip/ZipFile;

    invoke-direct {v2, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_25} :catch_59

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config/devices/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v1

    if-eqz v1, :cond_44

    .line 366
    invoke-virtual {v2, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    .line 367
    invoke-static {p0, v0, p1}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/InputStream;I)V

    goto :goto_58

    .line 370
    :cond_44
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " device config not found"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_58
    return-void

    :catch_59
    move-exception p0

    const-string p1, "failed to load data.zip: "

    .line 360
    invoke-static {v0, p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    .line 355
    :cond_60
    new-instance p0, Ljava/io/FileNotFoundException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Missing "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static loadConfigFromSd()V
    .registers 0

    return-void
.end method

.method public static declared-synchronized reload()V
    .registers 2

    const-class v0, Lcom/navngo/igo/javaclient/Config;

    monitor-enter v0

    .line 401
    :try_start_3
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->loadConfigFromSd()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_8

    .line 402
    monitor-exit v0

    return-void

    :catchall_8
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized reload(I)V
    .registers 9

    const-class v0, Lcom/navngo/igo/javaclient/Config;

    monitor-enter v0

    packed-switch p0, :pswitch_data_136

    :try_start_6
    const-string v1, "Config"

    goto :goto_4c

    :pswitch_9
    const-string v1, "Config"

    const-string v2, "reloading configs AFTER_MEDIA_SCANNING"

    .line 974
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_11
    const-string v1, "Config"

    const-string v2, "reloading configs BEFORE_MEDIA_SCANNING"

    .line 973
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_19
    const-string v1, "Config"

    const-string v2, "reloading configs AFTER_REBUILD_DATA"

    .line 972
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_21
    const-string v1, "Config"

    const-string v2, "reloading configs ON_MEDIA_CHANGE"

    .line 971
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_29
    const-string v1, "Config"

    const-string v2, "reloading configs BEFORE_SD_READY"

    .line 970
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_31
    const-string v1, "Config"

    const-string v2, "reloading configs AT_BOOT_RECEIVE"

    .line 969
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_39
    const-string v1, "Config"

    const-string v2, "reloading configs AT_REINIT"

    .line 968
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :pswitch_41
    const-string v1, "Config"

    const-string v2, "reloading configs AT_INIT"

    .line 967
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :catchall_49
    move-exception p0

    goto/16 :goto_134

    :goto_4c
    const-string v2, "reloading configs DON\'T KNOW WHY"

    .line 976
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catchall {:try_start_6 .. :try_end_51} :catchall_49

    :goto_51
    const/16 v1, 0xa

    const/4 v2, 0x0

    if-nez p0, :cond_96

    .line 993
    :try_start_56
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    sget-object v5, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    .line 994
    invoke-virtual {v5}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/navngo/igo/javaclient/R$raw;->sys:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v5, 0x2710

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_6e} :catch_93
    .catchall {:try_start_56 .. :try_end_6e} :catchall_90

    :try_start_6e
    const-string v4, "iGO.apk#sys.txt"

    .line 997
    invoke-static {v4, v3, v1}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/BufferedReader;I)V

    const/4 v4, 0x1

    .line 999
    invoke-static {v4}, Lcom/navngo/igo/javaclient/Config;->getDeviceConfig(Z)Ljava/io/BufferedReader;

    move-result-object v2

    if-eqz v2, :cond_81

    const-string v4, "iGO.apk#device.ini"

    const/16 v5, 0x442

    .line 1002
    invoke-static {v4, v2, v5}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;Ljava/io/BufferedReader;I)V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_81} :catch_8b
    .catchall {:try_start_6e .. :try_end_81} :catchall_85

    :cond_81
    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    goto :goto_97

    :catchall_85
    move-exception p0

    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    goto/16 :goto_f7

    :catch_8b
    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    goto/16 :goto_115

    :catchall_90
    move-exception p0

    move-object v3, v2

    goto :goto_f7

    :catch_93
    move-object v3, v2

    goto/16 :goto_115

    :cond_96
    move-object v3, v2

    .line 1006
    :goto_97
    :try_start_97
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->UpdateCache()V

    if-nez p0, :cond_9f

    .line 1011
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->createSDCardDir()V

    .line 1014
    :cond_9f
    invoke-static {}, Lcom/navngo/igo/javaclient/RootPathDetector;->detect()V

    .line 1026
    new-instance p0, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "sys.txt"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_d6

    .line 1027
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "sys.txt"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/navngo/igo/javaclient/Config;->loadConfig(Ljava/lang/String;I)V

    .line 1029
    :cond_d6
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->loadConfigFromSd()V
    :try_end_d9
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_d9} :catch_114
    .catchall {:try_start_97 .. :try_end_d9} :catchall_f6

    if-eqz v2, :cond_e7

    .line 1035
    :try_start_db
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_de} :catch_df
    .catchall {:try_start_db .. :try_end_de} :catchall_49

    goto :goto_e7

    :catch_df
    move-exception p0

    :try_start_e0
    const-string v1, "Config"

    const-string v2, ""

    .line 1037
    invoke-static {v1, v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_e7
    .catchall {:try_start_e0 .. :try_end_e7} :catchall_49

    :cond_e7
    :goto_e7
    if-eqz v3, :cond_12f

    .line 1042
    :try_start_e9
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_ec
    .catch Ljava/io/IOException; {:try_start_e9 .. :try_end_ec} :catch_ed
    .catchall {:try_start_e9 .. :try_end_ec} :catchall_49

    goto :goto_12f

    :catch_ed
    move-exception p0

    :try_start_ee
    const-string v1, "Config"

    const-string v2, ""

    .line 1044
    :goto_f2
    invoke-static {v1, v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_f5
    .catchall {:try_start_ee .. :try_end_f5} :catchall_49

    goto :goto_12f

    :catchall_f6
    move-exception p0

    :goto_f7
    if-eqz v2, :cond_105

    .line 1035
    :try_start_f9
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_fc
    .catch Ljava/io/IOException; {:try_start_f9 .. :try_end_fc} :catch_fd
    .catchall {:try_start_f9 .. :try_end_fc} :catchall_49

    goto :goto_105

    :catch_fd
    move-exception v1

    :try_start_fe
    const-string v2, "Config"

    const-string v4, ""

    .line 1037
    invoke-static {v2, v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_105
    .catchall {:try_start_fe .. :try_end_105} :catchall_49

    :cond_105
    :goto_105
    if-eqz v3, :cond_113

    .line 1042
    :try_start_107
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_10a
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_10a} :catch_10b
    .catchall {:try_start_107 .. :try_end_10a} :catchall_49

    goto :goto_113

    :catch_10b
    move-exception v1

    :try_start_10c
    const-string v2, "Config"

    const-string v3, ""

    .line 1044
    invoke-static {v2, v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1047
    :cond_113
    :goto_113
    throw p0
    :try_end_114
    .catchall {:try_start_10c .. :try_end_114} :catchall_49

    :catch_114
    nop

    :goto_115
    if-eqz v2, :cond_123

    .line 1035
    :try_start_117
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_11a
    .catch Ljava/io/IOException; {:try_start_117 .. :try_end_11a} :catch_11b
    .catchall {:try_start_117 .. :try_end_11a} :catchall_49

    goto :goto_123

    :catch_11b
    move-exception p0

    :try_start_11c
    const-string v1, "Config"

    const-string v2, ""

    .line 1037
    invoke-static {v1, v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_123
    .catchall {:try_start_11c .. :try_end_123} :catchall_49

    :cond_123
    :goto_123
    if-eqz v3, :cond_12f

    .line 1042
    :try_start_125
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_128
    .catch Ljava/io/IOException; {:try_start_125 .. :try_end_128} :catch_129
    .catchall {:try_start_125 .. :try_end_128} :catchall_49

    goto :goto_12f

    :catch_129
    move-exception p0

    :try_start_12a
    const-string v1, "Config"

    const-string v2, ""

    goto :goto_f2

    .line 1049
    :cond_12f
    :goto_12f
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->UpdateCache()V
    :try_end_132
    .catchall {:try_start_12a .. :try_end_132} :catchall_49

    .line 1050
    monitor-exit v0

    return-void

    :goto_134
    monitor-exit v0

    throw p0

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_41
        :pswitch_39
        :pswitch_31
        :pswitch_29
        :pswitch_21
        :pswitch_19
        :pswitch_11
        :pswitch_9
    .end packed-switch
.end method

.method public static translatePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "/"

    .line 697
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    .line 699
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static useDefaultLocation()Z
    .registers 5

    .line 330
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    if-nez v0, :cond_1c

    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    if-nez v0, :cond_1c

    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    if-nez v0, :cond_1c

    sget-wide v0, Lcom/navngo/igo/javaclient/Config;->default_latitude:D

    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_1c

    sget-wide v0, Lcom/navngo/igo/javaclient/Config;->default_longitude:D

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    return v0
.end method
