package com.navngo.igo.javaclient.utils;

import com.navngo.igo.javaclient.DebugLogger;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class ZipUtility {
    private static final String logname = "ZipUtility";

    public static boolean unzipNeeded(Map<String, Long> map, String str) {
        if (map == null) {
            return true;
        }
        for (String str2 : map.keySet()) {
            File file = new File(str, str2);
            if (!file.exists() || file.lastModified() < map.get(str2).longValue() || !file.isFile()) {
                return true;
            }
        }
        return false;
    }

    public static void unzip(String str, String str2, String str3) throws IOException {
        File parentFile;
        long length = new File(str).length();
        if (0 == length || 22 == length) {
            DebugLogger.D3(logname, "Empty zip file. No need to unzip.");
            return;
        }
        ZipFile zipFile = new ZipFile(str);
        try {
            String upperCase = str2.toUpperCase(Locale.US);
            Enumeration<? extends ZipEntry> enumerationEntries = zipFile.entries();
            while (enumerationEntries.hasMoreElements()) {
                ZipEntry zipEntryNextElement = enumerationEntries.nextElement();
                long time = zipEntryNextElement.getTime();
                if (!zipEntryNextElement.isDirectory()) {
                    String name = zipEntryNextElement.getName();
                    if (name.toUpperCase(Locale.US).startsWith(upperCase)) {
                        String str4 = str3 + name;
                        File file = new File(str4);
                        if (!file.getCanonicalPath().startsWith(new File(str3).getCanonicalPath())) {
                            DebugLogger.D3(logname, "Skipping malicious Zip entry: '" + name + "'");
                        } else {
                            if (file.length() == 0) {
                                DebugLogger.D4(logname, "deleting " + name);
                                file.delete();
                            }
                            if (file.exists() && time < file.lastModified()) {
                                DebugLogger.D5(logname, str + "/" + name + " is older than " + file + " d=" + (time - file.lastModified()));
                            } else {
                                DebugLogger.D4(logname, "extracting " + name);
                                try {
                                    parentFile = new File(file.getParentFile().getCanonicalPath());
                                } catch (Exception unused) {
                                    parentFile = new File(str4).getParentFile();
                                }
                                if (parentFile != null) {
                                    parentFile.mkdirs();
                                }
                                InputStream inputStream = zipFile.getInputStream(zipEntryNextElement);
                                IOException iOException = null;
                                try {
                                    if (file.exists()) {
                                        file.delete();
                                    }
                                    StreamUtility.copyFile(inputStream, str4);
                                    file.setLastModified(time);
                                } catch (IOException e) {
                                    DebugLogger.D1(logname, "unzip", e);
                                    iOException = new IOException(name + ":" + e.getLocalizedMessage());
                                    file.delete();
                                }
                                if (file.length() != zipEntryNextElement.getSize()) {
                                    DebugLogger.D4(logname, "deleting crappy " + name);
                                    file.delete();
                                    if (iOException == null) {
                                        iOException = new IOException(name);
                                    }
                                }
                                inputStream.close();
                                if (iOException != null) {
                                    throw iOException;
                                }
                            }
                        }
                    }
                }
            }
        } finally {
            zipFile.close();
        }
    }
}
