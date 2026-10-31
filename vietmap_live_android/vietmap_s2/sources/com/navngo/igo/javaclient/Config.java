package com.navngo.igo.javaclient;

import android.os.Process;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Config {
    public static final int ANDROID_MUTING_DEVICE_ANDROID = 1;
    public static final int ANDROID_MUTING_DEVICE_AUDIOFOCUS = 2;
    public static final int ANDROID_MUTING_DEVICE_EMPTY = 0;
    public static final int CANVAS_MATRIX_HACK_IDENTITY = 2;
    public static final int CANVAS_MATRIX_HACK_INVERT = 3;
    public static final int CANVAS_MATRIX_HACK_INVERT_NEGOFFSET = 4;
    public static final int CANVAS_MATRIX_HACK_INVERT_ZEROOFFSET = 5;
    public static final int CANVAS_MATRIX_HACK_NONE = 0;
    public static final int CANVAS_MATRIX_HACK_NULL = 1;
    public static final int MOUSE_MATRIX_HACK_INVERT = 3;
    public static final int MOUSE_MATRIX_HACK_NONE = 0;
    public static final int RELOAD_AFTER_MEDIA_SCANNING = 7;
    public static final int RELOAD_AFTER_REBUILD_DATA = 5;
    public static final int RELOAD_AT_BOOT_RECEIVE = 2;
    public static final int RELOAD_AT_INIT = 0;
    public static final int RELOAD_AT_REINIT = 1;
    public static final int RELOAD_BEFORE_MEDIA_SCANNING = 6;
    public static final int RELOAD_BEFORE_SD_READY = 3;
    public static final int RELOAD_ON_MEDIA_CHANGE = 4;
    private static final String aliases_ini = "!aliases.ini";
    public static final String appname = "iGO";
    public static final int audio_mode = 0;
    public static final String contentzip = "content.zip";
    public static String dataDir = null;
    public static final boolean debug = false;
    public static final int def_SOUND_TIMEOUT = 1500;
    public static final int def_android_muting_device = 2;
    public static final boolean def_bipbip_during_call = true;
    public static final int def_bipbip_timeout = 1400;
    public static final int def_bt_route = 16;
    public static final boolean def_bt_sco_on = false;
    public static final int def_cache_size = 20000000;
    public static final boolean def_disable_volume_changed_action = false;
    public static final int def_getdeviceid_trycount = 5;
    public static final boolean def_has_physical_home_button = true;
    public static final boolean def_interface_vfont_enabled = false;
    public static final String def_location_log_filename = "LocationManager";
    public static final boolean def_location_log_repeat = true;
    public static final int def_mediascanning_timeout = 20000;
    public static final boolean def_oldViewContactMethod = false;
    public static final int def_on_low_memory = 12000000;
    public static final boolean def_register_functors = true;
    public static final boolean def_sensors_on = false;
    public static final boolean def_setup_audio_path = false;
    public static final boolean def_show_background_notification = true;
    public static final boolean def_speakerphone_on = false;
    public static final boolean def_start_on_boot = false;
    public static final boolean def_start_on_insert_sdcard = true;
    public static final int def_startengine_timeout = 120000;
    public static final boolean def_tablet = false;
    public static final boolean def_use_last_known_position = false;
    public static final int def_wait_for_gdbserver = 60000;
    public static final boolean delete_old_solib = true;
    public static final boolean delete_tahoma = true;
    public static final boolean delete_tuttifrutti = true;
    public static final boolean destroy_with_activity = false;
    private static final String egl_cfg = "/system/lib/egl/egl.cfg";
    private static final String egl_cfg_missing_fallback = "/system/lib/egl/libGLES_android.so";
    private static final int egl_display_index = 0;
    private static final boolean egl_implementation_hardware = true;
    public static final boolean enable_navigateto_processer = false;
    public static final boolean gdb = false;
    public static final int getGpsMinTime = 999;
    public static final boolean googleaddressdecoder = false;
    public static final int gps_time_treshold = 1471228928;
    public static final boolean inAppShopEnabled = true;
    public static final boolean install_tahoma = false;
    public static final int install_timeout = 60000;
    public static final boolean install_to_sd = true;
    public static final boolean install_tuttifrutti = false;
    public static final boolean isGooglePlay = true;
    public static final boolean is_synctool = false;
    public static final boolean is_toolbox = false;
    public static final String libName = "igo_jni";
    public static final String licence_lock_hardcoded_to = "android_id";
    public static final int licencing_validity_period = 30;
    public static final String licensezip = "license.zip";
    public static final String link_to_sdcard_igo_dir = "android_linked_root";
    public static final boolean load_systxt_from_sd = false;
    private static final String logname = "Config";
    public static final String oslangcodes_ini = "content/config/oslangcodes.ini";
    public static String packageName = null;
    public static final boolean permission_contacts_is_critical = false;
    public static final boolean permission_location_is_critical = true;
    public static final boolean permission_microphone_is_critical = false;
    public static final boolean permission_phone_is_critical = true;
    public static final boolean permission_storage_is_critical = true;
    public static final String pluginszip = "ui_plugins.zip";
    public static boolean publicKeyDecodeNeeded = true;
    public static final String resourceszip = "resources.zip";
    private static final boolean sd_config_allowed = false;
    public static final boolean sd_full_on_install_is_fatal = false;
    public static String sdcardDir = null;
    public static String sdcardRoot = null;
    public static final boolean sdcard_on_notification_bar = false;
    public static String secondaryRootDir = null;
    public static String serverFolder = null;
    public static final boolean start_on_GCoor = false;
    private static final String sysTxtName = "sys.txt";
    public static final String ttszip = "tts.zip";
    public static final boolean useCustomLicensingPolicy = false;
    public static final boolean use_icu_libs = true;
    public static final boolean use_permission_contacts = false;
    public static final boolean use_permission_location = true;
    public static final boolean use_permission_microphone = false;
    public static final boolean use_permission_phone = false;
    public static final boolean use_permission_storage = true;
    public static final boolean usingOsDownloader = false;
    public static byte[] playStorePublicKey = BuildConfig.playStorePublicKey;
    public static final String[] extlist_license = {".lic", ".lyc"};
    public static final String[] extlist_lang = {".zip", ".gro"};
    public static final String[] extlist_voice = {".zip", ".gro"};
    public static final String[] extlist_plugins = {".zip"};
    public static final String[] assets_to_install = {"data.zip", "data.gro", "branding.zip", "branding.gro"};
    public static String serverStartDir = null;
    public static boolean ignore_spoofed_keys = true;
    public static boolean select_eglconfig_zeroalpha = false;
    private static final String[] egl_variants = {"/system/lib/egl/libGLES_%s.so", "/system/lib/egl/libEGL_%s.so", "/system/lib/egl/libGLES_v1_CM_%s.so", "/system/lib/egl/libGLES_v2_%s.so"};
    public static boolean create_sdcard_dir = true;
    public static boolean check_folders_after_rebuild = false;
    public static final String def_linked_root_list = null;
    public static String ux_plugin_folder = "ux";
    public static boolean location_gps = true;
    public static boolean location_net = true;
    public static boolean location_nmea = false;
    public static boolean location_shiny = false;
    public static boolean accuracy_workaround = false;
    public static boolean location_log = false;
    public static double default_latitude = Double.NaN;
    public static double default_longitude = Double.NaN;
    public static String logcat_file = null;
    public static String logcat_file_trigger = null;
    public static String logcat_tag = "navngo";
    public static int logcat_level = 3;
    public static int logcat_oslevel = 5;
    public static boolean logcat_date = true;
    public static boolean logcat_thread = false;
    public static String logcat_pid = ": ";
    public static int logcat_file_delay = 0;
    public static int logcat_max_file_size = 0;
    public static int logcat_max_file_count = 0;
    public static int log_fps = 0;
    public static boolean silent_startup = false;
    public static final String def_imei = null;
    public static boolean getdeviceid_gemini = false;
    public static final int def_wait_for_sdcard_on_boot = 30000;
    public static int memorywatcher_timeout_foreground = def_wait_for_sdcard_on_boot;
    public static long memorywatcher_timeout_background = -1;
    public static int update_denied_timeout_foreground = 5000;
    public static int background_shutdown_timeout = 600000;
    public static int background_shutdown_distance = 100;
    public static int canvas_matrix_hack = 0;
    public static int mouse_matrix_hack = 3;
    public static int navigation_audio_stream = 3;
    public static int navigation_audio_usage = 12;
    public static int navigation_audio_content_type = 1;
    public static int android_audiofocus_gain_method = 2;
    public static boolean def_notify_network_status = true;
    public static int dragprocesstime = 20;
    public static int network_jelre_fanyalodunk_timeout = 0;
    public static int gps_lost_timeout = def_wait_for_sdcard_on_boot;
    public static boolean lock_to_external_sd = false;
    public static boolean enableInsertContactWithNewApi = false;
    public static boolean fourway_orientable_device = false;
    public static boolean upside_down_bug = false;
    public static boolean check_gps_timestamp = true;
    public static boolean def_background_navigation = false;
    public static int horizontal_accuracy_treshold = 100;
    public static int orientationchange_timeout = 4000;
    public static int def_paint_data_unavailable_timeout = 10;
    public static boolean fullscreen = false;
    public static final String def_factory_reset = null;
    public static boolean def_callSystemExit = false;
    public static final String def_additional_assets = "";
    public static String def_customMissingContentMessage = def_additional_assets;
    public static boolean check_for_dead_links = false;
    public static String android_muting_device_name = "android";
    public static String IMD_component = def_additional_assets;
    public static String IMD_category = def_additional_assets;
    public static String IMD_start_action = def_additional_assets;
    public static String IMD_stop_action = def_additional_assets;
    public static String IMD_exit_action = def_additional_assets;
    public static boolean IMD_app_mute = true;
    public static boolean def_wait_for_closing_igo = false;
    public static boolean def_wait_for_engine_shutdown = true;
    public static boolean def_recheck_igo_folder_after_restart = false;
    public static boolean def_no_zip_if_city_available = false;
    public static boolean android_ssl_pinning = false;
    public static String[] android_ssl_trusted_certs = null;
    public static String android_ssl_client_cert = null;
    public static String android_ssl_client_key = null;
    public static String android_ssl_client_password = null;
    public static Pattern[] android_proxy_patterns = null;
    public static String[] android_proxy_servers = null;
    public static boolean androidNightModeChangeOnIntent = false;
    public static boolean useExternalNightModeManager = false;
    private static LayeredConfig mLayeredConfig = null;
    private static boolean log_file_path_is_setup = false;

    private static void loadConfigFromSd() {
    }

    public static boolean useDefaultLocation() {
        return (location_gps || location_net || location_nmea || default_latitude == Double.NaN || default_longitude == Double.NaN) ? false : true;
    }

    public static void loadConfigFromApk() throws Throwable {
        packageName = Application.anApplication.getPackageName();
        String str = Application.anApplication.getFilesDir().getParent() + "/";
        serverFolder = str;
        serverStartDir = str;
        try {
            if (new File(serverFolder + sysTxtName).exists()) {
                loadConfig(serverFolder + sysTxtName, 10);
            } else {
                loadConfig("iGO.apk#sys.txt", Application.anApplication.getResources().openRawResource(R.raw.sys), 10);
            }
            UpdateCache();
        } catch (IOException e) {
            DebugLogger.D2(logname, "Exception when loading sys.txt", e);
        }
    }

    private static void loadConfigFromDataZip(String str, int i) throws Throwable {
        String str2 = sdcardDir + "data.zip";
        if (!new File(str2).exists()) {
            throw new FileNotFoundException("Missing " + str2);
        }
        try {
            ZipFile zipFile = new ZipFile(str2);
            ZipEntry entry = zipFile.getEntry("config/devices/" + str);
            if (entry != null) {
                loadConfig(str, zipFile.getInputStream(entry), i);
                return;
            }
            DebugLogger.D3(logname, str + " device config not found");
        } catch (Exception e) {
            DebugLogger.D1(logname, "failed to load data.zip: ", e);
        }
    }

    public static synchronized void reload() {
        loadConfigFromSd();
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x010f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static java.lang.String detectCharsetFromBOM(java.io.BufferedInputStream r13, java.lang.String r14, boolean r15) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 345
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Config.detectCharsetFromBOM(java.io.BufferedInputStream, java.lang.String, boolean):java.lang.String");
    }

    private static void loadConfig(String str, int i) throws Throwable {
        File file = new File(str);
        if (!file.exists()) {
            throw new FileNotFoundException("Missing " + str);
        }
        loadConfig(str, new FileInputStream(file), i);
    }

    public static void addConfig(int i, String str, String str2, String str3, String str4) {
        mLayeredConfig.add(i, str, str2, str3, str4);
    }

    private static void loadConfig(String str, InputStream inputStream, int i) throws Throwable {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        String strDetectCharsetFromBOM = detectCharsetFromBOM(bufferedInputStream, "UTF-8", false);
        DebugLogger.D5(logname, "Loading config; filename='" + str + ", charset='" + strDetectCharsetFromBOM + "'");
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(bufferedInputStream, strDetectCharsetFromBOM), 10000);
            try {
                loadConfig(str, bufferedReader2, i);
                try {
                    bufferedReader2.close();
                } catch (IOException unused) {
                }
            } catch (Throwable th) {
                th = th;
                bufferedReader = bufferedReader2;
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (IOException unused2) {
                    }
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private static void loadConfig(String str, BufferedReader bufferedReader, int i) throws Throwable {
        Pattern patternCompile = Pattern.compile("^\\s*(?:;.*)?$");
        Pattern patternCompile2 = Pattern.compile("^\\s*([^=]*)\\s*=\\s*\"?([^\"]*)\"?\\s*$");
        Pattern patternCompile3 = Pattern.compile("^\\s*\\[\\s*(.*?)\\s*\\]\\s*$");
        Pattern patternCompile4 = Pattern.compile("(^!include:)(\\S*[\\\\\\/])(\\S*\\.ini)$");
        if (mLayeredConfig == null) {
            mLayeredConfig = new LayeredConfig();
        }
        int i2 = 0;
        String lowerCase = null;
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                return;
            }
            i2++;
            Matcher matcher = patternCompile4.matcher(line);
            if (matcher.matches()) {
                loadConfigFromDataZip(matcher.group(3).toLowerCase(Locale.ROOT), i);
            } else if (!patternCompile.matcher(line).matches()) {
                Matcher matcher2 = patternCompile3.matcher(line);
                if (matcher2.matches()) {
                    lowerCase = matcher2.group(1).toLowerCase(Locale.ROOT);
                } else {
                    Matcher matcher3 = patternCompile2.matcher(line);
                    if (matcher3.matches()) {
                        mLayeredConfig.add(i, lowerCase, matcher3.group(1).toLowerCase(Locale.ROOT), matcher3.group(2), str);
                    } else {
                        DebugLogger.D2(logname, "bad line: " + str + ":" + i2 + ": " + line);
                    }
                }
            }
        }
    }

    private static void UpdateCache() {
        if (mLayeredConfig == null) {
            return;
        }
        location_gps = getBool("gps", "location_gps", location_gps);
        location_net = getBool("gps", "location_net", location_net);
        location_log = getBool("gps", "location_log", location_log);
        default_latitude = getDouble("gps", "default_latitude", default_latitude);
        default_longitude = getDouble("gps", "default_longitude", default_longitude);
        location_nmea = getBool("gps", "location_nmea", location_nmea);
        location_shiny = getBool("gps", "location_shiny", location_shiny);
        boolean bool = getBool("gps", "accuracy_workaround", accuracy_workaround);
        accuracy_workaround = bool;
        if (bool) {
            location_nmea = true;
            DebugLogger.D3(logname, "Android accuracy_workaround enabled");
        } else {
            DebugLogger.D5(logname, "Android accuracy_workaround disabled");
        }
        int i = getInt("gps", "network_jelre_fanyalodunk_timeout", network_jelre_fanyalodunk_timeout);
        network_jelre_fanyalodunk_timeout = i;
        DebugLogger.D5(logname, String.format(null, "network_jelre_fanyalodunk_timeout = %d", Integer.valueOf(i)));
        check_gps_timestamp = getBool("gps", "check_gps_timestamp", check_gps_timestamp);
        log_fps = getInt("debug", "log_fps", log_fps);
        silent_startup = getBool("debug", "silent_startup", silent_startup);
        logcat_file = getString("android", "logcat_file", logcat_file);
        logcat_file_trigger = getString("android", "logcat_file_trigger", logcat_file_trigger);
        logcat_tag = getString("android", "logcat_tag", logcat_tag);
        lock_to_external_sd = getBool("android", "lock_to_external_sd", lock_to_external_sd);
        logcat_level = getInt("android", "logcat_level", logcat_level);
        logcat_oslevel = getInt("android", "logcat_oslevel", logcat_oslevel);
        logcat_date = getBool("android", "logcat_date", logcat_date);
        logcat_thread = getBool("android", "logcat_thread", logcat_thread);
        logcat_pid = getBool("android", "logcat_pid", false) ? " (" + Process.myPid() + "): " : ": ";
        logcat_file_delay = getInt("android", "logcat_file_delay", logcat_file_delay);
        logcat_max_file_size = getInt("android", "logcat_max_file_size_in_kilobytes", logcat_max_file_size / 1024) * 1024;
        logcat_max_file_count = getInt("android", "logcat_max_file_count", logcat_max_file_count);
        memorywatcher_timeout_foreground = getInt("android", "memorywatcher_timeout_foreground", memorywatcher_timeout_foreground);
        memorywatcher_timeout_background = getLong("android", "memorywatcher_timeout_background", memorywatcher_timeout_background);
        background_shutdown_timeout = getInt("android", "background_shutdown_timeout", background_shutdown_timeout);
        background_shutdown_distance = getInt("android", "background_shutdown_distance", background_shutdown_distance);
        String string = getString("android", "canvas_matrix_hack", def_additional_assets + canvas_matrix_hack);
        if (string.equalsIgnoreCase("none")) {
            canvas_matrix_hack = 0;
        } else if (string.equalsIgnoreCase("null")) {
            canvas_matrix_hack = 1;
        } else if (string.equalsIgnoreCase("identity")) {
            canvas_matrix_hack = 2;
        } else if (string.equalsIgnoreCase("invert")) {
            canvas_matrix_hack = 3;
        } else if (string.equalsIgnoreCase("invert-negoffset")) {
            canvas_matrix_hack = 4;
        } else if (string.equalsIgnoreCase("invert-zerooffset")) {
            canvas_matrix_hack = 5;
        }
        String string2 = getString("android", "mouse_matrix_hack", def_additional_assets + mouse_matrix_hack);
        if (string2.equalsIgnoreCase("none")) {
            mouse_matrix_hack = 0;
        } else if (string2.equalsIgnoreCase("invert")) {
            mouse_matrix_hack = 3;
        }
        navigation_audio_stream = getInt("android", "navigation_audio_stream", navigation_audio_stream);
        navigation_audio_usage = getInt("android", "navigation_audio_usage", navigation_audio_usage);
        dragprocesstime = getInt("android", "dragprocesstime", dragprocesstime);
        upside_down_bug = getBool("android", "upside_down_bug", upside_down_bug);
        fourway_orientable_device = getBool("android", "fourway_orientable_device", getString("device", "type", def_additional_assets).equalsIgnoreCase("moz"));
        orientationchange_timeout = getInt("android", "orientationchange_timeout", orientationchange_timeout);
        fullscreen = getBool("android", "fullscreen", fullscreen);
        update_denied_timeout_foreground = getInt("android", "update_denied_timeout_foreground", update_denied_timeout_foreground);
        getdeviceid_gemini = getBool("android", "getdeviceid_gemini", getdeviceid_gemini);
        check_for_dead_links = getBool("android", "check_for_dead_links", check_for_dead_links);
        create_sdcard_dir = getBool("android", "create_sdcard_dir", create_sdcard_dir);
        check_folders_after_rebuild = getBool("android", "check_folders_after_rebuild", check_folders_after_rebuild);
        ignore_spoofed_keys = getBool("android", "ignore_spoofed_keys", ignore_spoofed_keys);
        android_audiofocus_gain_method = getInt("sound", "android_audiofocus_gain_method", android_audiofocus_gain_method);
        sdcardRoot = getString("folders", "sdcardpath", sdcardRoot);
        sdcardDir = getString("folders", "linked_root", sdcardDir);
        dataDir = getString("folders", "data", null);
        secondaryRootDir = getString("folders", "secondary_root", sdcardDir);
        ux_plugin_folder = getString("folders", "ux_folder", ux_plugin_folder);
        String string3 = getString("folders", "mkdirs", def_additional_assets);
        if (string3.length() > 0) {
            File file = new File(string3);
            if (!file.isDirectory()) {
                if (file.exists()) {
                    DebugLogger.D2(logname, "non-directory:mkdirs=" + string3);
                } else if (file.mkdirs()) {
                    DebugLogger.D3(logname, "Directory created: " + string3);
                }
            }
        }
        android_muting_device_name = getString("sound", "android_muting_device_name", android_muting_device_name);
        IMD_component = getString("intent_muting_device", "component", IMD_component);
        IMD_category = getString("intent_muting_device", "category", IMD_category);
        IMD_start_action = getString("intent_muting_device", "start_action", IMD_start_action);
        IMD_stop_action = getString("intent_muting_device", "stop_action", IMD_stop_action);
        IMD_exit_action = getString("intent_muting_device", "exit_action", IMD_exit_action);
        IMD_app_mute = getBool("intent_muting_device", "app_mute", IMD_app_mute);
        android_ssl_pinning = getBool("android.ssl", "pinning_enabled", android_ssl_pinning);
        android_ssl_client_key = getString("android.ssl", "client_key", android_ssl_client_key);
        android_ssl_client_password = getString("android.ssl", "client_password", android_ssl_client_password);
        android_ssl_client_cert = getString("android.ssl", "client_cert", android_ssl_client_cert);
        int i2 = getInt("android.ssl", "trusted_cert.size", 0);
        if (i2 > 0) {
            android_ssl_trusted_certs = new String[i2];
            for (int i3 = 0; i3 < i2; i3++) {
                android_ssl_trusted_certs[i3] = getString("android.ssl", "trusted_cert[" + i3 + "]", android_ssl_trusted_certs[i3]);
            }
        }
        int i4 = getInt("android.proxy", "rule.size", 0);
        if (i4 > 0) {
            android_proxy_patterns = new Pattern[i4];
            android_proxy_servers = new String[i4];
            for (int i5 = 0; i5 < i4; i5++) {
                android_proxy_patterns[i5] = Pattern.compile(getString("android.proxy", "rule[" + i5 + "].pattern", def_additional_assets), 2);
                android_proxy_servers[i5] = getString("android.proxy", "rule[" + i5 + "].server", def_additional_assets);
            }
        }
        select_eglconfig_zeroalpha = getBool("rawdisplay", "select_eglconfig_zeroalpha", select_eglconfig_zeroalpha);
    }

    private static void createSDCardDir() {
        if (!create_sdcard_dir || sdcardDir == null) {
            return;
        }
        File file = new File(sdcardDir);
        if (file.exists()) {
            return;
        }
        DebugLogger.D3(logname, "creating sdcardDir: " + sdcardDir);
        if (file.mkdirs()) {
            return;
        }
        DebugLogger.D3(logname, "failed to create sdcardDir: " + sdcardDir);
    }

    public static String translatePath(String str) {
        if (str.startsWith("/")) {
            return str;
        }
        return serverStartDir + str;
    }

    public static void initialize() {
        DebugLogger.D5(logname, "initialize");
        createSDCardDir();
        RootPathDetector.detect();
        loadConfigFromSd();
        log_file_path_is_setup = sdcardDir != null;
        reload(0);
        DebugLogger.D5(logname, "initialize done");
    }

    public static boolean isLogFilePathSetup() {
        return log_file_path_is_setup;
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00d0 A[Catch: IOException -> 0x00d3, TRY_LEAVE, TryCatch #5 {IOException -> 0x00d3, blocks: (B:49:0x00cb, B:51:0x00d0), top: B:73:0x00cb }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00cb A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private static java.io.BufferedReader getAliasesIni(boolean r9) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 233
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Config.getAliasesIni(boolean):java.io.BufferedReader");
    }

    private static void loadAliasesIni(boolean z) {
        String str;
        BufferedReader aliasesIni = null;
        try {
            try {
                aliasesIni = getAliasesIni(z);
                if (aliasesIni != null) {
                    StringBuilder sb = new StringBuilder();
                    if (z) {
                        str = "iGO.apk#";
                    } else {
                        str = sdcardDir + "config.zip#";
                    }
                    sb.append(str);
                    sb.append(aliases_ini);
                    loadConfig(sb.toString(), aliasesIni, LayeredConfig.PRIO_DEVICE_CONFIG);
                }
                if (aliasesIni != null) {
                    aliasesIni.close();
                }
            } catch (IOException unused) {
                if (aliasesIni != null) {
                    aliasesIni.close();
                }
            } catch (Throwable th) {
                if (aliasesIni != null) {
                    try {
                        aliasesIni.close();
                    } catch (IOException e) {
                        DebugLogger.D1(logname, def_additional_assets, e);
                    }
                }
                throw th;
            }
        } catch (IOException e2) {
            DebugLogger.D1(logname, def_additional_assets, e2);
        }
    }

    private static ZipEntry checkDeviceIni(ZipFile zipFile, String str) {
        if (!silent_startup) {
            DebugLogger.D3(logname, "trying to use device config by " + str + ".ini");
        }
        if (str.length() <= 0) {
            return null;
        }
        ZipEntry entry = zipFile.getEntry("config/devices/" + str + ".ini");
        if (entry == null) {
            return entry;
        }
        DebugLogger.D3(logname, "using device config by : " + str);
        return entry;
    }

    /* JADX WARN: Removed duplicated region for block: B:83:0x0183  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private static java.io.BufferedReader getDeviceConfig(boolean r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 406
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Config.getDeviceConfig(boolean):java.io.BufferedReader");
    }

    /* JADX WARN: Removed duplicated region for block: B:81:0x0107 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0125 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00f9 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0117 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:? A[Catch: all -> 0x0049, SYNTHETIC, TRY_LEAVE, TryCatch #3 {all -> 0x0049, blocks: (B:16:0x004c, B:39:0x00db, B:44:0x00e9, B:73:0x012f, B:48:0x00f2, B:42:0x00e0, B:52:0x00f9, B:57:0x0107, B:61:0x0113, B:60:0x010c, B:55:0x00fe, B:64:0x0117, B:69:0x0125, B:67:0x011c, B:6:0x0009, B:7:0x0011, B:8:0x0019, B:9:0x0021, B:10:0x0029, B:11:0x0031, B:12:0x0039, B:13:0x0041), top: B:78:0x0003, inners: #5, #10, #11, #12 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static synchronized void reload(int r8) {
        /*
            Method dump skipped, instruction units count: 330
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Config.reload(int):void");
    }

    public static String find_libEGL() {
        String str = egl_cfg_missing_fallback;
        try {
            if (!new File(egl_cfg).exists()) {
                DebugLogger.D2(logname, "find_libEGL:egl.cfg not exists");
            } else {
                Pattern patternCompile = Pattern.compile("^\\s*(\\d+)\\s+(\\d+)\\s+(\\S+)\\s*$");
                for (String str2 : StreamUtility.readFile(egl_cfg).split("(?s)\\n")) {
                    Matcher matcher = patternCompile.matcher(str2);
                    if (matcher.matches()) {
                        int i = Integer.parseInt(matcher.group(1));
                        int i2 = Integer.parseInt(matcher.group(2));
                        String strGroup = matcher.group(3);
                        if (i == 0 && i2 == 1) {
                            for (String str3 : egl_variants) {
                                File file = new File(String.format(str3, strGroup));
                                String absolutePath = file.getAbsolutePath();
                                if (file.exists()) {
                                    DebugLogger.D5(logname, "find_libEGL: using line:        " + str2);
                                    DebugLogger.D4(logname, "find_libEGL: using lib: " + absolutePath);
                                    return absolutePath;
                                }
                                DebugLogger.D5(logname, "find_libEGL: not found: " + absolutePath);
                            }
                        } else {
                            DebugLogger.D5(logname, "find_libEGL: non-matching line: " + str2);
                        }
                    } else {
                        DebugLogger.D5(logname, "find_libEGL: comment line:     " + str2);
                    }
                }
                str = "libEGL.so";
            }
        } catch (IOException e) {
            DebugLogger.D2(logname, "find_libEGL:egl.cfg not found", e);
        }
        DebugLogger.D2(logname, "find_libEGL: better then nothing: " + str);
        return str;
    }

    public static boolean getBool(String str, String str2, boolean z) {
        return mLayeredConfig.getBool(str, str2, z);
    }

    public static int getInt(String str, String str2, int i) {
        return mLayeredConfig.getInt(str, str2, i);
    }

    public static String getString(String str, String str2, String str3) {
        return mLayeredConfig.getString(str, str2, str3);
    }

    public static long getLong(String str, String str2, long j) {
        return mLayeredConfig.getLong(str, str2, j);
    }

    public static double getDouble(String str, String str2, double d) {
        return mLayeredConfig.getDouble(str, str2, d);
    }
}
