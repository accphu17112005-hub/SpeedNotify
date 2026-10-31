package com.navngo.igo.javaclient;

import android.os.Build;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class RootPathDetector {
    private static String logname = "RootPathDetector";

    private RootPathDetector() {
    }

    public static void detect() {
        String str;
        StringBuilder sb;
        String str2;
        StringBuilder sb2;
        try {
            try {
            } catch (Exception e) {
                DebugLogger.D1(logname, "detectRootPaths", e);
                str = logname;
                sb = new StringBuilder();
            }
            if (StreamUtility.isDirectory(Config.sdcardRoot) && StreamUtility.isDirectory(Config.sdcardDir)) {
                DebugLogger.D3(logname, "detectRootPaths: first guess matches");
                str2 = logname;
                sb2 = new StringBuilder();
            } else {
                DebugLogger.D3(logname, "detectRootPaths: searching better than: sdcardRoot= " + Config.sdcardRoot + " sdcardDir= " + Config.sdcardDir);
                if (Config.getBool("folders", "use_external_files_dir", true) && Build.VERSION.SDK_INT >= 19) {
                    File[] externalFilesDirs = Application.anApplication.getExternalFilesDirs(null);
                    Arrays.sort(externalFilesDirs, new Comparator<File>() { // from class: com.navngo.igo.javaclient.RootPathDetector.1
                        @Override // java.util.Comparator
                        public int compare(File file, File file2) {
                            int length = StreamUtility.getFileList(file, (String[]) null).length;
                            int length2 = StreamUtility.getFileList(file2, (String[]) null).length;
                            if (length < length2) {
                                return 1;
                            }
                            return length > length2 ? -1 : 0;
                        }
                    });
                    for (File file : externalFilesDirs) {
                        if (file != null) {
                            if (try_sdcardDir(file)) {
                                DebugLogger.D3(logname, "detectRootPaths: found external files dir=" + file.getAbsolutePath());
                                str2 = logname;
                                sb2 = new StringBuilder();
                                break;
                            }
                        } else {
                            DebugLogger.D3(logname, "detectRootPaths: unavailable external files dir found");
                        }
                    }
                }
                String string = Config.getString("folders", "data_folder_name", Config.packageName);
                String string2 = Config.getString("folders", "linked_root_list", Config.def_linked_root_list);
                if (string2 == null || !try_sdcard_dirlist(string2.split("\\s+"), string)) {
                    String[] strArrSplit = StreamUtility.readFile("/proc/mounts").split("(?s)\\n");
                    ArrayList arrayList = new ArrayList();
                    for (String str3 : strArrSplit) {
                        String[] strArrSplit2 = str3.split("\\s+");
                        if (strArrSplit2.length > 1) {
                            arrayList.add(strArrSplit2[1].replaceFirst("/*$", "/"));
                        }
                    }
                    if (!try_sdcard_dirlist((String[]) arrayList.toArray(new String[0]), string)) {
                        DebugLogger.D2(logname, "detectRootPaths: data folder not found");
                        Config.sdcardDir = null;
                        Config.sdcardRoot = null;
                        str = logname;
                        sb = new StringBuilder();
                        sb.append("sdcardRoot= ");
                        sb.append(Config.sdcardRoot);
                        sb.append(" sdcardDir= ");
                        sb.append(Config.sdcardDir);
                        DebugLogger.D3(str, sb.toString());
                        return;
                    }
                    DebugLogger.D3(logname, "detectRootPaths: found in /proc/mounts");
                    str2 = logname;
                    sb2 = new StringBuilder();
                } else {
                    DebugLogger.D3(logname, "detectRootPaths: found on linked_root_list");
                    str2 = logname;
                    sb2 = new StringBuilder();
                }
            }
            sb2.append("sdcardRoot= ");
            sb2.append(Config.sdcardRoot);
            sb2.append(" sdcardDir= ");
            sb2.append(Config.sdcardDir);
            DebugLogger.D3(str2, sb2.toString());
        } catch (Throwable th) {
            DebugLogger.D3(logname, "sdcardRoot= " + Config.sdcardRoot + " sdcardDir= " + Config.sdcardDir);
            throw th;
        }
    }

    private static boolean try_sdcardDir(File file) {
        if (!Config.silent_startup) {
            DebugLogger.D3(logname, "trying " + file.getAbsolutePath());
        }
        if ((!StreamUtility.isDirectory(file) || Config.check_folders_after_rebuild) && StreamUtility.getFileList(file, (String[]) null).length <= 0) {
            return false;
        }
        Config.sdcardRoot = file.getParentFile().getAbsolutePath() + "/";
        Config.sdcardDir = file.getAbsolutePath() + "/";
        return true;
    }

    private static boolean try_sdcard_dirlist(String[] strArr, String str) {
        for (String str2 : strArr) {
            if (try_sdcardDir(new File(str2, "iGO")) || try_sdcardDir(new File(str2, str))) {
                return true;
            }
            if (try_sdcardDir(new File(str2, "Android/data/" + Config.packageName + "/files"))) {
                return true;
            }
        }
        return false;
    }
}
