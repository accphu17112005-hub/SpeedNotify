package com.navngo.igo.javaclient;

import android.content.SharedPreferences;
import android.content.res.Resources;
import android.widget.Toast;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.R;
import com.navngo.igo.javaclient.receiver.PetzaCommandReceiver;
import com.navngo.igo.javaclient.utils.StreamUtility;
import com.navngo.igo.javaclient.utils.ZipUtility;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class DataInstaller {
    private static final String logname = "DataInstaller";

    private static void checkFolderContent(File file, String[] strArr) throws NNG.ImproperContent {
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (String str : strArr) {
            if (z) {
                z = false;
            } else {
                sb.append(",");
            }
            sb.append(str);
        }
        DebugLogger.D5(logname, String.format("checkFolderContent(%s, [%s])", file, sb));
        File[] fileList = StreamUtility.getFileList(file, strArr);
        if (fileList == null || fileList.length == 0) {
            int iIndexOf = file.getAbsolutePath().indexOf("iGO");
            String absolutePath = file.getAbsolutePath();
            if (iIndexOf >= 0) {
                absolutePath = absolutePath.substring(iIndexOf);
            }
            throw new NNG.ImproperContent(absolutePath);
        }
    }

    public static void RebuildLibDir(Resources resources, boolean z) {
        if (z) {
            if (new File(Config.serverFolder + "libigo_jni.so").delete()) {
                DebugLogger.D3(logname, "Deleted old version of libigo_jni.so");
            }
        }
    }

    public static boolean hasZeroSizeFile(File file, String[] strArr, boolean z) {
        File[] fileArrListFiles;
        List listAsList = Arrays.asList(strArr);
        if (!file.exists() || (fileArrListFiles = file.listFiles()) == null) {
            return false;
        }
        boolean zHasZeroSizeFile = false;
        for (File file2 : fileArrListFiles) {
            if (z || listAsList.contains(file2.getName())) {
                if (file2.isDirectory()) {
                    zHasZeroSizeFile |= hasZeroSizeFile(file2, strArr, true);
                } else if (file2.length() == 0) {
                    return true;
                }
            }
        }
        return zHasZeroSizeFile;
    }

    public static Exception RebuildDataDir(Resources resources, boolean z) throws Exception {
        DebugLogger.D5(logname, "entering RebuildDataDir()");
        if (Config.check_for_dead_links) {
            recreateSoftLinks(resources, false);
        }
        if (!z) {
            z = hasZeroSizeFile(new File(Config.serverFolder), Config.getString("folders", "zero_check_filter_list", "sys.txt").split("\\s+"), false);
        }
        boolean z2 = z;
        if (z2) {
            NNG.intParams[0] = 1;
            RebuildDataDir_serverFolder(resources);
        }
        File file = new File(Config.serverFolder + "license");
        File file2 = new File(Config.serverFolder + "content/lang");
        File file3 = new File(Config.serverFolder + "content/voice");
        IOException e = null;
        try {
            RebuildDataDir_SDCard(resources, z2, file, file2, file3, new File(Config.serverFolder + Config.ux_plugin_folder));
        } catch (IOException e2) {
            e = e2;
        }
        try {
            if (Config.check_folders_after_rebuild) {
                checkFolderContent(file, Config.extlist_license);
                checkFolderContent(file2, Config.extlist_lang);
                checkFolderContent(file3, Config.extlist_voice);
            }
            DebugLogger.D4(logname, "exiting RebuildDataDir()");
            return e;
        } catch (Exception e3) {
            if (e != null) {
                throw e;
            }
            throw e3;
        }
    }

    public static boolean checkLink(String str) {
        return new File(str).exists();
    }

    public static boolean recreateSoftlink(String str, String str2, boolean z) {
        if (z || (new File(str).exists() && !checkLink(str2))) {
            return NNG.RecreateSoftlink(str, str2);
        }
        return true;
    }

    private static void recreateSoftLinks(Resources resources, boolean z) throws IOException {
        DebugLogger.D3(logname, "recreateSoftlink(" + Config.sdcardDir + ", " + Config.link_to_sdcard_igo_dir + ", " + z + ")");
        if (!recreateSoftlink(Config.sdcardDir, Config.link_to_sdcard_igo_dir, z)) {
            throw new IOException(Config.link_to_sdcard_igo_dir);
        }
        String[] strArr = {"content", "license", "debug"};
        for (int i = 0; i < 3; i++) {
            String str = strArr[i];
            if (!recreateSoftlink(Config.getString("folders", str, Config.sdcardDir + str), str, z)) {
                throw new IOException(str);
            }
        }
        if (!NNG.RecreateSoftlink(Config.getString("folders", "ui_plugins", Config.sdcardDir + Config.ux_plugin_folder), Config.ux_plugin_folder)) {
            throw new IOException(Config.ux_plugin_folder);
        }
        for (String str2 : Config.assets_to_install) {
            if (!recreateSoftlink(new File(Config.getString("folders", str2.replace('.', '_'), Config.sdcardDir), str2).toString(), str2, z)) {
                throw new IOException(str2);
            }
        }
    }

    private static void RebuildDataDir_serverFolder(Resources resources) throws Throwable {
        recreateSoftLinks(resources, true);
        String str = Config.serverFolder + "audio";
        DebugLogger.D5(logname, "audiodirpath: " + str);
        StreamUtility.deleteRecursive(new File(str));
        StreamUtility.copyRawResource(resources, R.raw.sys, Config.serverFolder + "sys.txt");
        StreamUtility.copyRawResource(resources, R.raw.icudt64l, Config.serverFolder + "icudt64l.dat");
        String str2 = Config.serverFolder + "tahoma.ttf";
        String str3 = Config.serverFolder + "tahoma.ttf";
        DebugLogger.D3(logname, "deleting tahoma");
        if (new File(str2).delete()) {
            DebugLogger.D5(logname, "deleted " + str2);
        }
        if (new File(str3).delete()) {
            DebugLogger.D5(logname, "deleted " + str3);
        }
        String str4 = Config.serverFolder + "FrutigerOTS.ttf";
        String str5 = Config.serverFolder + "FrutigerNextCom-Regular.ttf";
        DebugLogger.D3(logname, "deleting frutti");
        if (new File(str4).delete()) {
            DebugLogger.D5(logname, "deleted " + str4);
        }
        if (new File(str5).delete()) {
            DebugLogger.D5(logname, "deleted " + str5);
        }
        DebugLogger.D3(logname, "creating kuka_logger, monkey");
        StreamUtility.copyRawResource(resources, R.raw.kuka_logger, Config.serverFolder + "kuka_logger.txt");
        StreamUtility.copyRawResource(resources, R.raw.monkey, Config.serverFolder + "monkey.txt");
        if (Config.getBool("interface", "vfont_enabled", false)) {
            DebugLogger.D3(logname, "creating vfonts");
            StreamUtility.unsplitAsset(resources, "tahoma_vfont", Config.serverFolder + "tahoma.vfont");
            StreamUtility.unsplitAsset(resources, "tahomabd_vfont", Config.serverFolder + "tahomabd.vfont");
        }
        try {
            StreamUtility.copyRawResource(resources, R.raw.class.getField("release").getInt(null), Config.serverFolder + "release.txt");
            DebugLogger.D3(logname, "Extracted release.txt from package");
        } catch (Exception unused) {
            DebugLogger.D3(logname, "No release.txt found in package");
        }
        String string = Config.getString("android", "additional_assets", Config.def_additional_assets);
        if (string.length() > 0) {
            for (String str6 : string.split(",")) {
                String str7 = Config.serverFolder + str6;
                String strReplace = str6.replace('.', '_');
                DebugLogger.D3(logname, "creating" + str7);
                StreamUtility.unsplitAsset(resources, strReplace, str7);
            }
        }
    }

    private static int getCachedAssetListLength(Resources resources, String str, boolean z) throws IOException {
        int i;
        SharedPreferences sharedPreferences = Application.anApplication.getSharedPreferences("ASSET_LIST_LENGTH_CACHE", 0);
        if (!z && (i = sharedPreferences.getInt(str, -1)) > -1) {
            return i;
        }
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        int length = resources.getAssets().list(str).length;
        editorEdit.putInt(str, length);
        editorEdit.commit();
        return length;
    }

    private static void RebuildDataDir_SDCard(Resources resources, boolean z, File file, File file2, File file3, File file4) throws Throwable {
        String string;
        for (String str : Config.assets_to_install) {
            String str2 = Config.sdcardDir + str;
            String strReplace = str.replace('.', '_');
            if ((z || !new File(str2).exists()) && getCachedAssetListLength(resources, strReplace, z) != 0) {
                DebugLogger.D3(logname, "creating " + str2);
                StreamUtility.unsplitAsset(resources, strReplace, str2);
            }
        }
        if (getCachedAssetListLength(resources, "license_zip", z) != 0 && (z || StreamUtility.getFileList(file, Config.extlist_license).length == 0)) {
            DebugLogger.D3(logname, "creating license/");
            string = Config.sdcardDir + Config.licensezip;
            StreamUtility.unsplitAsset(resources, "license_zip", string);
            try {
                if (Config.getString("folders", "license", Config.def_additional_assets).isEmpty()) {
                    ZipUtility.unzip(string, Config.def_additional_assets, Config.sdcardDir + "license/");
                } else {
                    ZipUtility.unzip(string, Config.def_additional_assets, Config.serverFolder + "license/");
                }
                new File(string).delete();
            } finally {
            }
        }
        if (getCachedAssetListLength(resources, "content_zip", z) != 0 && (z || StreamUtility.getFileList(file2, Config.extlist_lang).length == 0 || StreamUtility.getFileList(file3, Config.extlist_voice).length == 0)) {
            DebugLogger.D3(logname, "creating content/");
            String str3 = Config.getBool("android", "copy_content_to_data_dir", false) ? Config.dataDir : Config.sdcardDir;
            if (!str3.endsWith(File.separator)) {
                str3 = str3 + File.separator;
            }
            string = str3 + Config.contentzip;
            StreamUtility.unsplitAsset(resources, "content_zip", string);
            try {
                ZipUtility.unzip(string, Config.def_additional_assets, str3 + "content/");
            } finally {
            }
        }
        String str4 = Config.sdcardDir + Config.ux_plugin_folder + "/";
        if (getCachedAssetListLength(resources, "ui_plugins_zip", z) != 0 && (z || StreamUtility.getFileList(file4, Config.extlist_plugins).length == 0)) {
            DebugLogger.D3(logname, "creating ui plugins");
            StringBuilder sb = new StringBuilder();
            sb.append(Config.getBool("android", "temp_files_in_server_folder", false) ? Config.serverFolder : Config.sdcardDir);
            sb.append(Config.pluginszip);
            string = sb.toString();
            boolean bool = Config.getBool("android", "clear_ux_folder_before_install", true);
            StreamUtility.unsplitAsset(resources, "ui_plugins_zip", string);
            if (new File(string).exists()) {
                try {
                    File file5 = new File(str4);
                    if (!file5.isDirectory()) {
                        if (file5.exists()) {
                            DebugLogger.D2(logname, "Non-directory: " + str4);
                        } else if (file5.mkdirs()) {
                            DebugLogger.D3(logname, "Directory created: " + str4);
                        } else {
                            DebugLogger.D2(logname, "Directory creation failed: " + str4);
                        }
                    }
                    if (bool) {
                        deleteFolderContent(str4);
                    }
                    ZipUtility.unzip(string, Config.def_additional_assets, str4);
                } finally {
                }
            }
        }
        String str5 = Config.sdcardDir + "tts_nua_ve1/";
        if (getCachedAssetListLength(resources, "tts_zip", z) != 0) {
            if (z || StreamUtility.getFileList(new File(str5), (String[]) null).length == 0) {
                DebugLogger.D3(logname, "creating tts_nua_ve1/");
                string = Config.sdcardDir + Config.ttszip;
                StreamUtility.unsplitAsset(resources, "tts_zip", string);
                try {
                    ZipUtility.unzip(string, Config.def_additional_assets, str5);
                } finally {
                }
            }
        }
    }

    private static void createFolder(String str) {
        try {
            new File(str).mkdirs();
        } catch (Exception e) {
            DebugLogger.D2(logname, "Unable to create folder: " + str, e);
        }
    }

    private static void deleteFolderContent(String str) {
        File file = new File(str);
        if (file.exists()) {
            for (File file2 : file.listFiles()) {
                file2.delete();
            }
        }
    }

    public static void SyncDirs(File file, File file2) throws IOException {
        if (!file.exists()) {
            StreamUtility.deleteRecursive(file2);
            DebugLogger.D3(logname, "SyncDirs: " + file2.getAbsolutePath() + " removed");
            return;
        }
        if (!file2.exists()) {
            if (file.isDirectory()) {
                file2.mkdir();
            } else {
                StreamUtility.copyFile(file.getAbsolutePath(), file2.getAbsolutePath());
                DebugLogger.D3(logname, "SyncDirs: " + file2.getAbsolutePath() + " added");
                return;
            }
        }
        if (file.isDirectory() && file2.isDirectory()) {
            HashSet<String> hashSet = new HashSet();
            hashSet.addAll(Arrays.asList(file.list()));
            hashSet.addAll(Arrays.asList(file2.list()));
            for (String str : hashSet) {
                SyncDirs(new File(file, str), new File(file2, str));
            }
            return;
        }
        if (file.lastModified() != file2.lastModified()) {
            file2.delete();
            StreamUtility.copyFile(file.getAbsolutePath(), file2.getAbsolutePath());
            file2.setLastModified(file.lastModified());
            DebugLogger.D3(logname, "SyncDirs: " + file2.getAbsolutePath() + " rewritten");
        }
    }

    public static void checkFactoryReset(final IgoActivity igoActivity) {
        String string = Config.getString("android", "factory_reset", Config.def_factory_reset);
        if (string != null) {
            File file = new File(Config.translatePath(string));
            if (file.exists()) {
                if (igoActivity != null) {
                    igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.DataInstaller.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(igoActivity, R.string.factory_reset, 1).show();
                        }
                    });
                }
                DebugLogger.D3(logname, "iGO factory reset by " + string);
                file.delete();
                StreamUtility.deleteRecursive(new File(Config.serverFolder + PetzaCommandReceiver.PETZA_SAVE));
            }
        }
    }

    public static void unpackDebugger(Resources resources) {
        String str = Config.serverFolder + "gdbserver";
        File file = new File(str);
        try {
            if (getCachedAssetListLength(resources, "gdbserver", true) != 0) {
                DebugLogger.D3(logname, "creating gdbserver");
                StreamUtility.unsplitAsset(resources, "gdbserver", str);
                Runtime.getRuntime().exec(new String[]{"chmod", "755", str}).waitFor();
            } else if (file.exists()) {
                DebugLogger.D3(logname, "deleting gdbserver");
                file.delete();
            }
        } catch (Exception e) {
            DebugLogger.D2(logname, "unpackDebugger", e);
        }
    }
}
