package com.navngo.igo.javaclient.utils;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class StreamUtility {
    private static final String logname = "StreamUtility";

    public static byte[] readInputStream(InputStream inputStream, int i) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i);
        try {
            byte[] bArr = new byte[i];
            while (true) {
                int i2 = inputStream.read(bArr);
                if (i2 != -1) {
                    byteArrayOutputStream.write(bArr, 0, i2);
                } else {
                    byteArrayOutputStream.close();
                    return byteArrayOutputStream.toByteArray();
                }
            }
        } catch (Throwable th) {
            byteArrayOutputStream.close();
            throw th;
        }
    }

    public static void copyFile(InputStream inputStream, String str) throws Throwable {
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(str);
            try {
                appendFile(inputStream, fileOutputStream2);
                fileOutputStream2.flush();
                fileOutputStream2.close();
            } catch (Throwable th) {
                th = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public static void appendFile(InputStream inputStream, OutputStream outputStream) throws IOException {
        try {
            byte[] bArr = new byte[1024];
            while (true) {
                int i = inputStream.read(bArr);
                if (i != -1) {
                    outputStream.write(bArr, 0, i);
                } else {
                    outputStream.flush();
                    return;
                }
            }
        } catch (IOException e) {
            DebugLogger.D1(logname, "appendFile:", e);
            throw e;
        }
    }

    public static void copyFile(String str, String str2) throws Throwable {
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        try {
            fileInputStream = new FileInputStream(str);
        } catch (Throwable th) {
            th = th;
        }
        try {
            copyFile(fileInputStream, str2);
            fileInputStream.close();
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = fileInputStream;
            if (fileInputStream2 != null) {
                fileInputStream2.close();
            }
            throw th;
        }
    }

    public static boolean compareFiles(InputStream inputStream, InputStream inputStream2) throws IOException {
        byte[] bArr = new byte[1024];
        byte[] bArr2 = new byte[1024];
        while (true) {
            int i = inputStream.read(bArr);
            if (i != inputStream2.read(bArr2)) {
                return false;
            }
            if (i == -1) {
                return true;
            }
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    if (bArr[i2] != bArr2[i2]) {
                        return false;
                    }
                    i = i2;
                }
            }
        }
    }

    public static File[] getFileList(File file, String[] strArr) {
        FilenameFilter filenameFilter;
        File[] fileArrListFiles = null;
        if (isDirectory(file)) {
            if (strArr != null) {
                try {
                    if (strArr.length != 0) {
                        filenameFilter = new FilenameFilter(strArr) { // from class: com.navngo.igo.javaclient.utils.StreamUtility.1ExtensionFilter
                            final String[] mExtensions;

                            {
                                this.mExtensions = strArr;
                            }

                            @Override // java.io.FilenameFilter
                            public boolean accept(File file2, String str) {
                                for (String str2 : this.mExtensions) {
                                    if (str.endsWith(str2)) {
                                        return true;
                                    }
                                }
                                return false;
                            }
                        };
                        fileArrListFiles = file.listFiles(filenameFilter);
                    } else {
                        filenameFilter = null;
                        fileArrListFiles = file.listFiles(filenameFilter);
                    }
                } catch (Exception unused) {
                }
            } else {
                filenameFilter = null;
                fileArrListFiles = file.listFiles(filenameFilter);
            }
        }
        return fileArrListFiles == null ? new File[0] : fileArrListFiles;
    }

    public static String[] getFileList(String str, Pattern pattern) {
        String[] list = new File(str).list();
        if (list == null) {
            return new String[0];
        }
        int length = list.length;
        int i = length;
        int i2 = i;
        while (true) {
            int i3 = i - 1;
            if (i <= 0) {
                break;
            }
            if (!pattern.matcher(list[i3]).matches()) {
                i2--;
                list[i3] = list[i2];
            }
            i = i3;
        }
        if (i2 == length) {
            return list;
        }
        String[] strArr = new String[i2];
        System.arraycopy(list, 0, strArr, 0, i2);
        return strArr;
    }

    public static boolean isDirectory(File file) {
        return file != null && file.isDirectory();
    }

    public static boolean isDirectory(String str) {
        if (str == null) {
            return false;
        }
        return isDirectory(new File(str));
    }

    public static boolean canReadFile(String str) {
        if (str == null) {
            return false;
        }
        File file = new File(str);
        return file.exists() && file.isFile() && file.canRead();
    }

    public static String readFile(Context context, int i) throws IOException {
        InputStream inputStreamOpenRawResource = null;
        try {
            inputStreamOpenRawResource = context.getResources().openRawResource(i);
            return new String(readInputStream(inputStreamOpenRawResource, 4096));
        } finally {
            if (inputStreamOpenRawResource != null) {
                try {
                    inputStreamOpenRawResource.close();
                } catch (IOException e) {
                    DebugLogger.D2(logname, e.getMessage());
                }
            }
        }
    }

    public static String readFile(String str) throws Throwable {
        FileInputStream fileInputStream = null;
        try {
            FileInputStream fileInputStream2 = new FileInputStream(str);
            try {
                String str2 = new String(readInputStream(fileInputStream2, 4096));
                try {
                    fileInputStream2.close();
                } catch (IOException e) {
                    DebugLogger.D2(logname, e.getMessage());
                }
                return str2;
            } catch (Throwable th) {
                th = th;
                fileInputStream = fileInputStream2;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e2) {
                        DebugLogger.D2(logname, e2.getMessage());
                    }
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public static void writeUtf8(String str, DataOutputStream dataOutputStream) throws IOException {
        ByteBuffer byteBufferEncode = Charset.forName("UTF-8").encode(str);
        int iLimit = byteBufferEncode.limit();
        dataOutputStream.writeShort(iLimit);
        for (int i = 0; i < iLimit; i++) {
            dataOutputStream.writeByte(byteBufferEncode.get(i));
        }
    }

    public static void deleteRecursive(File file) {
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                deleteRecursive(file2);
            }
        }
        if (file.delete()) {
            DebugLogger.D5(logname, "deleteRecursive: deleted: " + file.getName());
            return;
        }
        DebugLogger.D3(logname, "deleteRecursive: Cannot delete: " + file.getName());
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b0 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b7 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static void unsplitAsset(android.content.res.Resources r10, java.lang.String r11, java.lang.String r12) throws java.lang.Throwable {
        /*
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "installing "
            r0.append(r1)
            r0.append(r12)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "StreamUtility"
            com.navngo.igo.javaclient.DebugLogger.D4(r1, r0)
            java.io.File r0 = new java.io.File
            r0.<init>(r12)
            r2 = 0
            android.content.res.AssetManager r3 = r10.getAssets()     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            java.lang.String[] r3 = r3.list(r11)     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            if (r3 == 0) goto L65
            int r4 = r3.length     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            if (r4 <= 0) goto L65
            java.util.Arrays.sort(r3)     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            java.io.FileOutputStream r4 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            r4.<init>(r0)     // Catch: java.lang.Throwable -> L74 java.io.IOException -> L78
            int r5 = r3.length     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            r6 = 0
        L33:
            if (r6 >= r5) goto L66
            r7 = r3[r6]     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            r8.<init>()     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            r8.append(r11)     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            java.lang.String r9 = "/"
            r8.append(r9)     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            r8.append(r7)     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            java.lang.String r7 = r8.toString()     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            android.content.res.AssetManager r8 = r10.getAssets()     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            r9 = 2
            java.io.InputStream r7 = r8.open(r7, r9)     // Catch: java.lang.Throwable -> L5f java.io.IOException -> L62
            appendFile(r7, r4)     // Catch: java.io.IOException -> L5d java.lang.Throwable -> Lad
            r7.close()     // Catch: java.io.IOException -> L5d java.lang.Throwable -> Lad
            int r6 = r6 + 1
            goto L33
        L5d:
            r10 = move-exception
            goto L7b
        L5f:
            r10 = move-exception
            r7 = r2
            goto Lae
        L62:
            r10 = move-exception
            r7 = r2
            goto L7b
        L65:
            r4 = r2
        L66:
            if (r4 == 0) goto L6d
            r4.close()     // Catch: java.io.IOException -> L6c
            goto L6d
        L6c:
            r2 = move-exception
        L6d:
            if (r2 != 0) goto L70
            return
        L70:
            r0.delete()
            throw r2
        L74:
            r10 = move-exception
            r4 = r2
            r7 = r4
            goto Lae
        L78:
            r10 = move-exception
            r4 = r2
            r7 = r4
        L7b:
            java.lang.String r11 = "unsplitAsset"
            com.navngo.igo.javaclient.DebugLogger.D1(r1, r11, r10)     // Catch: java.lang.Throwable -> Lad
            java.io.IOException r11 = new java.io.IOException     // Catch: java.lang.Throwable -> Lad
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lad
            r1.<init>()     // Catch: java.lang.Throwable -> Lad
            r1.append(r12)     // Catch: java.lang.Throwable -> Lad
            java.lang.String r12 = ":"
            r1.append(r12)     // Catch: java.lang.Throwable -> Lad
            java.lang.String r10 = r10.getLocalizedMessage()     // Catch: java.lang.Throwable -> Lad
            r1.append(r10)     // Catch: java.lang.Throwable -> Lad
            java.lang.String r10 = r1.toString()     // Catch: java.lang.Throwable -> Lad
            r11.<init>(r10)     // Catch: java.lang.Throwable -> Lad
            if (r7 == 0) goto La4
            r7.close()     // Catch: java.io.IOException -> La3
            goto La4
        La3:
        La4:
            if (r4 == 0) goto La9
            r4.close()     // Catch: java.io.IOException -> La9
        La9:
            r0.delete()
            throw r11
        Lad:
            r10 = move-exception
        Lae:
            if (r7 == 0) goto Lb5
            r7.close()     // Catch: java.io.IOException -> Lb4
            goto Lb5
        Lb4:
            r2 = move-exception
        Lb5:
            if (r4 == 0) goto Lc0
            r4.close()     // Catch: java.io.IOException -> Lbb
            goto Lc0
        Lbb:
            r11 = move-exception
            if (r2 == 0) goto Lbf
            goto Lc0
        Lbf:
            r2 = r11
        Lc0:
            if (r2 == 0) goto Lc6
            r0.delete()
            throw r2
        Lc6:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.utils.StreamUtility.unsplitAsset(android.content.res.Resources, java.lang.String, java.lang.String):void");
    }

    public static void copyAllAssets(AssetManager assetManager, String str, String str2) throws Throwable {
        try {
            for (String str3 : assetManager.list(str)) {
                try {
                    if (assetManager.list(str + str3).length == 0) {
                        copyAsset(assetManager, str + str3, str2 + str3);
                    } else {
                        if (!new File(str2 + str3).exists()) {
                            new File(str2 + str3).mkdirs();
                        }
                        copyAllAssets(assetManager, str + str3 + "/", str2 + str3 + "/");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e2) {
            DebugLogger.D1(logname, e2.getMessage(), e2);
        }
    }

    public static void copyAsset(AssetManager assetManager, String str, String str2) throws Throwable {
        DebugLogger.D4(logname, "Attempting to copy " + str + " into " + str2);
        try {
            copyFile(assetManager.open(str), str2);
        } catch (IOException e) {
            DebugLogger.D1(logname, e.getMessage(), e);
        }
    }

    public static void copyRawResource(Resources resources, int i, String str) throws Throwable {
        InputStream inputStreamOpenRawResource;
        DebugLogger.D4(logname, "installing " + str);
        try {
            inputStreamOpenRawResource = resources.openRawResource(i);
            try {
                copyFile(inputStreamOpenRawResource, str);
                if (inputStreamOpenRawResource != null) {
                    inputStreamOpenRawResource.close();
                }
            } catch (Throwable th) {
                th = th;
                if (inputStreamOpenRawResource != null) {
                    inputStreamOpenRawResource.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            inputStreamOpenRawResource = null;
        }
    }
}
