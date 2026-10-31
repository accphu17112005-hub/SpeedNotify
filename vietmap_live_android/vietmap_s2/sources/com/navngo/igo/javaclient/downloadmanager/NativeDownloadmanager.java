package com.navngo.igo.javaclient.downloadmanager;

import android.app.DownloadManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.R;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.intentprocessers.IIntentProcesser;
import com.navngo.igo.javaclient.utils.NotificationCreator;
import com.navngo.program.ProgramPhases;
import java.io.File;
import java.io.IOException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class NativeDownloadmanager implements IFunctorCollection, IIntentProcesser {
    public static final String ACTION_OPEN_SHOP = "com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.ACTION_OPEN_SHOP";
    public static final String DESTINATION = "dest";
    public static final String DESTINATION_TEMPORARY = "destTmp";
    public static final String DOWNLOADED_PACKAGE_SIZE = "downloadedPackageSize";
    public static final String DOWNLOADER_RECORDS = "downloaderRecords";
    public static final String DOWNLOAD_ID = "downloadId";
    public static final String DOWNLOAD_QUEUE = "downloadQueue";
    private static final int INTERVAL = 1000;
    public static final int INVALID_VALUE = -1;
    public static final String IN_PROGRESS_ID = "inProgressId";
    public static final String IN_PROGRESS_OBJ = "inProgressObj";
    public static final int NOTIFICATION_ID = 1;
    public static final String PACKAGES = "packages";
    public static final String PACKAGE_SIZE = "packageSize";
    public static final String QUEUE = "queue";
    public static final String REFERENCE_ID = "referenceId";
    public static final String SIZE = "size";
    public static final String TITLE = "title";
    public static final String URL_CSTR = "url";
    public static final String WIFI_ONLY = "wifiOnly";
    private static final String logname = "NativeDownloadmanager";
    private Handler mHandler;
    private Runnable mHandlerTask;

    private static String getRealPath(String str) {
        DebugLogger.D3(logname, "GetRealPath input: " + str);
        try {
            str = new File(str).getCanonicalPath();
        } catch (IOException unused) {
        }
        DebugLogger.D3(logname, "GetRealPath output: " + str);
        return str;
    }

    private NativeDownloadmanager() {
        initStatusSenderHandler();
    }

    private static class SingletonHelper {
        private static final NativeDownloadmanager instance = new NativeDownloadmanager();

        private SingletonHelper() {
        }
    }

    public static NativeDownloadmanager getInstance() {
        return SingletonHelper.instance;
    }

    private void initStatusSenderHandler() {
        DebugLogger.D3(logname, "initStatusSenderHandler()");
        try {
            this.mHandler = new Handler(Looper.getMainLooper());
            this.mHandlerTask = new Runnable() { // from class: com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.1
                @Override // java.lang.Runnable
                public void run() throws Throwable {
                    NativeDownloadmanager.this.updateNotification(NativeDownloadmanager.this.sendProgressStatus());
                    NativeDownloadmanager.this.mHandler.postDelayed(NativeDownloadmanager.this.mHandlerTask, 1000L);
                }
            };
        } catch (Exception e) {
            e.printStackTrace();
        }
        DebugLogger.D3(logname, "initStatusSenderHandler() done");
    }

    private void startReportSending() {
        DebugLogger.D4(logname, "startReportSending()");
        this.mHandlerTask.run();
    }

    private void stopReportSending() {
        this.mHandler.removeCallbacks(this.mHandlerTask);
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        DebugLogger.D5(logname, "registerFunctors");
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.ndm.download", this, "download");
        androidGo.registerFunctor("android.ndm.drop", this, "drop");
        androidGo.registerFunctor("android.ndm.fetch_size", this, "fetchSizeIgo");
        androidGo.registerFunctor("android.ndm.on_engine_start", this, "onEngineStart");
        androidGo.registerFunctor("android.ndm.on_engine_close", this, "onEngineClose");
    }

    private void clearOSQueue() {
        DebugLogger.D3(logname, "clearOSQueue");
        DownloadManager downloadManager = (DownloadManager) Application.anApplication.getSystemService("download");
        Cursor cursorQuery = downloadManager.query(new DownloadManager.Query().setFilterByStatus(31));
        DebugLogger.D3(logname, "clearOSQueue, count: " + cursorQuery.getCount());
        if (cursorQuery.moveToFirst()) {
            while (!cursorQuery.isAfterLast()) {
                int i = cursorQuery.getInt(cursorQuery.getColumnIndex("_id"));
                DebugLogger.D3(logname, "clearOSQueue, dropping download, id=" + i);
                downloadManager.remove((long) i);
                cursorQuery.moveToNext();
            }
        }
        cursorQuery.close();
    }

    private synchronized void clearDownloadQueue() {
        DebugLogger.D3(logname, "clearDownloadQueue");
        stopReportSending();
        clearOSQueue();
        SharedPreferences.Editor editorEdit = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0).edit();
        editorEdit.clear();
        editorEdit.commit();
        ((NotificationManager) Application.anApplication.getSystemService("notification")).cancel(1);
    }

    public void onEngineStart(boolean z) {
        clearDownloadQueue();
    }

    public void onEngineClose(boolean z) {
        clearDownloadQueue();
    }

    public synchronized void onDownloadSuccess(long j) {
        boolean zRenameTo;
        DebugLogger.D3(logname, "OnDownloadSuccess referenceId:" + j);
        SharedPreferences sharedPreferences = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0);
        String string = sharedPreferences.getString(IN_PROGRESS_OBJ, null);
        int i = sharedPreferences.getInt(IN_PROGRESS_ID, -1);
        if (i >= 0 && string != null) {
            try {
                try {
                    JSONObject jSONObject = new JSONObject(string);
                    if (jSONObject.length() > 0) {
                        int i2 = jSONObject.getInt(DOWNLOAD_ID);
                        String string2 = jSONObject.getString(DESTINATION_TEMPORARY);
                        String string3 = jSONObject.getString(DESTINATION);
                        File externalFilesDir = Application.anApplication.getApplicationContext().getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS);
                        if (string2.startsWith(externalFilesDir.getParent())) {
                            zRenameTo = new File(externalFilesDir, string2.substring(externalFilesDir.getCanonicalPath().length() + 1)).renameTo(new File(string3));
                        } else {
                            zRenameTo = new File(string2).renameTo(new File(string3));
                        }
                        if (!zRenameTo) {
                            DebugLogger.D2(logname, "OnDownloadSuccess failed to move downloaded file destTmp:'" + string2 + "' destReal:'" + string3 + "'");
                            onDownloadFailed(j, 1);
                            return;
                        }
                        DebugLogger.D3(logname, "OnDownloadSuccess downloadId:" + i2);
                        if (i2 != 0) {
                            AndroidGo.getInstance().callIgo("android.ndm.download_finished", null, Integer.valueOf(i2));
                        }
                        long j2 = jSONObject.getLong(SIZE);
                        if (!updateNotification(j2)) {
                            SharedPreferences.Editor editorEdit = sharedPreferences.edit();
                            editorEdit.putLong(DOWNLOADED_PACKAGE_SIZE, -1L);
                            editorEdit.commit();
                        } else if (j2 > 0) {
                            long j3 = sharedPreferences.getLong(DOWNLOADED_PACKAGE_SIZE, 0L);
                            SharedPreferences.Editor editorEdit2 = sharedPreferences.edit();
                            editorEdit2.putLong(DOWNLOADED_PACKAGE_SIZE, j3 + j2);
                            editorEdit2.commit();
                        }
                    } else {
                        DebugLogger.D2(logname, "No process in progress" + i);
                    }
                } catch (JSONException e) {
                    DebugLogger.D2(logname, "JSONException:exception: " + e.toString());
                }
            } catch (IOException e2) {
                DebugLogger.D2(logname, "IOException:exception: " + e2.toString());
            }
        } else {
            DebugLogger.D2(logname, " cannot send progress for progressid:" + i);
        }
        ((DownloadManager) Application.anApplication.getSystemService("download")).remove(j);
        SharedPreferences.Editor editorEdit3 = sharedPreferences.edit();
        editorEdit3.putLong(REFERENCE_ID, -1L);
        editorEdit3.commit();
        checkDownload();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x00a1 A[Catch: all -> 0x00b4, TRY_LEAVE, TryCatch #0 {, blocks: (B:3:0x0001, B:6:0x0044, B:8:0x004f, B:10:0x006d, B:13:0x0087, B:14:0x00a1), top: B:20:0x0001, inners: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public synchronized void onDownloadFailed(long r7, int r9) {
        /*
            r6 = this;
            monitor-enter(r6)
            java.lang.String r0 = "NativeDownloadmanager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb4
            r1.<init>()     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r2 = "onDownloadFailed referenceId:"
            r1.append(r2)     // Catch: java.lang.Throwable -> Lb4
            r1.append(r7)     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> Lb4
            com.navngo.igo.javaclient.DebugLogger.D3(r0, r1)     // Catch: java.lang.Throwable -> Lb4
            com.navngo.igo.javaclient.Application r0 = com.navngo.igo.javaclient.Application.anApplication     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r1 = "download"
            java.lang.Object r0 = r0.getSystemService(r1)     // Catch: java.lang.Throwable -> Lb4
            android.app.DownloadManager r0 = (android.app.DownloadManager) r0     // Catch: java.lang.Throwable -> Lb4
            r1 = 1
            long[] r2 = new long[r1]     // Catch: java.lang.Throwable -> Lb4
            r3 = 0
            r2[r3] = r7     // Catch: java.lang.Throwable -> Lb4
            r0.remove(r2)     // Catch: java.lang.Throwable -> Lb4
            com.navngo.igo.javaclient.Application r7 = com.navngo.igo.javaclient.Application.anApplication     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r8 = "downloaderRecords"
            android.content.SharedPreferences r7 = r7.getSharedPreferences(r8, r3)     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r8 = "inProgressObj"
            r0 = 0
            java.lang.String r8 = r7.getString(r8, r0)     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r2 = "inProgressId"
            r4 = -1
            int r2 = r7.getInt(r2, r4)     // Catch: java.lang.Throwable -> Lb4
            if (r2 < 0) goto La1
            if (r8 == 0) goto La1
            org.json.JSONObject r2 = new org.json.JSONObject     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r2.<init>(r8)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            int r8 = r2.length()     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            if (r8 <= 0) goto La1
            java.lang.String r8 = "downloadId"
            int r8 = r2.getInt(r8)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.String r2 = "NativeDownloadmanager"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r4.<init>()     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.String r5 = "onDownloadFailed downloadId:"
            r4.append(r5)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r4.append(r8)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.String r4 = r4.toString()     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            com.navngo.igo.javaclient.DebugLogger.D2(r2, r4)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            if (r8 == 0) goto La1
            com.navngo.igo.javaclient.androidgo.AndroidGo r2 = com.navngo.igo.javaclient.androidgo.AndroidGo.getInstance()     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.String r4 = "android.ndm.download_failed"
            r5 = 2
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.Integer r8 = java.lang.Integer.valueOf(r8)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r5[r3] = r8     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            java.lang.Integer r8 = java.lang.Integer.valueOf(r9)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r5[r1] = r8     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            r2.callIgo(r4, r0, r5)     // Catch: org.json.JSONException -> L86 java.lang.Throwable -> Lb4
            goto La1
        L86:
            r8 = move-exception
            java.lang.String r9 = "NativeDownloadmanager"
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb4
            r0.<init>()     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r1 = "JSONException:exception: "
            r0.append(r1)     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Throwable -> Lb4
            r0.append(r8)     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r8 = r0.toString()     // Catch: java.lang.Throwable -> Lb4
            com.navngo.igo.javaclient.DebugLogger.D2(r9, r8)     // Catch: java.lang.Throwable -> Lb4
        La1:
            android.content.SharedPreferences$Editor r7 = r7.edit()     // Catch: java.lang.Throwable -> Lb4
            java.lang.String r8 = "referenceId"
            r0 = -1
            r7.putLong(r8, r0)     // Catch: java.lang.Throwable -> Lb4
            r7.commit()     // Catch: java.lang.Throwable -> Lb4
            r6.checkDownload()     // Catch: java.lang.Throwable -> Lb4
            monitor-exit(r6)
            return
        Lb4:
            r7 = move-exception
            monitor-exit(r6)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.onDownloadFailed(long, int):void");
    }

    private void checkDownload() {
        long j = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0).getLong(REFERENCE_ID, -1L);
        DebugLogger.D3(logname, "CheckDownload() savedReferenceId: " + j);
        if (j < 0) {
            stopReportSending();
            JSONObject next = next();
            if (next != null) {
                DebugLogger.D3(logname, "CheckDownload() next is not null");
                startDownload(next);
                return;
            }
            NotificationManager notificationManager = (NotificationManager) Application.anApplication.getSystemService("notification");
            notificationManager.cancel(1);
            Intent mainActivityIntentWithShopExtra = getMainActivityIntentWithShopExtra();
            if (mainActivityIntentWithShopExtra != null) {
                notificationManager.notify(1, NotificationCreator.createHeadsUpNotification(Application.anApplication.getApplicationContext(), Application.anApplication.getString(R.string.content_download_finished), PendingIntent.getActivity(Application.anApplication.getApplicationContext(), 0, mainActivityIntentWithShopExtra, 201326592)));
            }
        }
    }

    public synchronized void download(String str, String str2, int i, String str3, long j, boolean z) {
        JSONArray jSONArrayOptJSONArray;
        JSONArray jSONArray;
        JSONObject jSONObject;
        String realPath = getRealPath(str2);
        String str4 = realPath + ".tmp";
        DebugLogger.D3(logname, "download url:" + str + " dest:" + realPath + " downloadId:" + i + " title:" + str3 + " size:" + j);
        SharedPreferences sharedPreferences = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0);
        String string = sharedPreferences.getString(DOWNLOAD_QUEUE, null);
        try {
            if (string == null) {
                jSONObject = new JSONObject();
                jSONArray = new JSONArray();
                jSONArrayOptJSONArray = new JSONArray();
            } else {
                JSONObject jSONObject2 = new JSONObject(string);
                JSONArray jSONArrayOptJSONArray2 = jSONObject2.optJSONArray(QUEUE);
                jSONArrayOptJSONArray = jSONObject2.optJSONArray(PACKAGES);
                jSONArray = jSONArrayOptJSONArray2;
                jSONObject = jSONObject2;
            }
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("url", str);
            jSONObject3.put(SIZE, j);
            jSONObject3.put(DESTINATION, realPath);
            jSONObject3.put(DESTINATION_TEMPORARY, str4);
            jSONObject3.put(DOWNLOAD_ID, i);
            jSONObject3.put(TITLE, str3);
            jSONObject3.put(WIFI_ONLY, z);
            jSONArray.put(jSONObject3);
            JSONArray jSONArrayAddSizeToPackage = addSizeToPackage(str3, j, jSONArrayOptJSONArray);
            jSONObject.put(QUEUE, jSONArray);
            jSONObject.put(PACKAGES, jSONArrayAddSizeToPackage);
            SharedPreferences.Editor editorEdit = sharedPreferences.edit();
            editorEdit.putString(DOWNLOAD_QUEUE, jSONObject.toString());
            editorEdit.commit();
            DebugLogger.D3(logname, "File added to queue. size:" + j + " bytes, URL: " + str);
        } catch (JSONException e) {
            DebugLogger.D2(logname, "JSONException:exception: " + e.toString());
        }
        checkDownload();
        DebugLogger.D3(logname, "download() finished");
    }

    private void startDownload(JSONObject jSONObject) {
        DebugLogger.D3(logname, "startDownload()");
        try {
            long j = jSONObject.getLong(SIZE);
            String string = jSONObject.getString("url");
            String string2 = jSONObject.getString(DESTINATION_TEMPORARY);
            boolean z = jSONObject.getBoolean(WIFI_ONLY);
            DebugLogger.D3(logname, "startDownload() size: " + j + "; url:" + string + "; dest:" + string2 + "; servicestring:download");
            DownloadManager downloadManager = (DownloadManager) Application.anApplication.getSystemService("download");
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(string));
            File externalFilesDir = Application.anApplication.getApplicationContext().getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS);
            if (string2.startsWith(externalFilesDir.getParent())) {
                String strSubstring = string2.substring(externalFilesDir.getCanonicalPath().length() + 1);
                request.setDestinationInExternalFilesDir(Application.anApplication.getApplicationContext(), Environment.DIRECTORY_DOWNLOADS, strSubstring);
                DebugLogger.D3(logname, "startDownload() temp file directory:" + externalFilesDir.getCanonicalPath() + " subpath:" + strSubstring);
            } else {
                DebugLogger.D3(logname, "startDownload() temp file :" + string2);
                request.setDestinationUri(Uri.fromFile(new File(string2)));
            }
            request.setVisibleInDownloadsUi(true);
            request.setNotificationVisibility(2);
            if (z) {
                request.setAllowedNetworkTypes(2);
            }
            long jEnqueue = downloadManager.enqueue(request);
            SharedPreferences.Editor editorEdit = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0).edit();
            editorEdit.putLong(REFERENCE_ID, jEnqueue);
            editorEdit.commit();
            startReportSending();
            DebugLogger.D4(logname, "File downloading. refid:" + jEnqueue + " size:" + j + " byte, url: " + string);
        } catch (IOException e) {
            DebugLogger.D2(logname, "IOException:exception: " + e.toString());
        } catch (JSONException e2) {
            DebugLogger.D2(logname, "JSONException:exception: " + e2.toString());
        }
        DebugLogger.D3(logname, "startDownload() done");
    }

    private JSONObject next() {
        SharedPreferences sharedPreferences;
        String string;
        DebugLogger.D3(logname, "Next()");
        JSONObject jSONObject = null;
        try {
            sharedPreferences = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0);
            string = sharedPreferences.getString(DOWNLOAD_QUEUE, null);
        } catch (JSONException e) {
            e = e;
        }
        if (string == null) {
            return null;
        }
        int i = sharedPreferences.getInt(IN_PROGRESS_ID, -1);
        JSONObject jSONObject2 = new JSONObject(string);
        JSONArray jSONArray = jSONObject2.getJSONArray(QUEUE);
        JSONArray jSONArray2 = new JSONArray();
        JSONObject jSONObject3 = null;
        for (int i2 = 0; i2 < jSONArray.length(); i2++) {
            try {
                jSONObject3 = jSONArray.getJSONObject(i2);
                if (jSONObject3.getInt(DOWNLOAD_ID) != i) {
                    jSONArray2.put(jSONObject3);
                }
            } catch (JSONException e2) {
                e = e2;
                jSONObject = jSONObject3;
                DebugLogger.D2(logname, "JSONException:exception: " + e.toString());
            }
        }
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        if (jSONArray2.length() < 1) {
            editorEdit.clear();
        } else {
            jSONObject = jSONArray2.getJSONObject(0);
            editorEdit.putInt(IN_PROGRESS_ID, jSONObject.getInt(DOWNLOAD_ID));
            editorEdit.putString(IN_PROGRESS_OBJ, jSONObject.toString());
            jSONObject2.put(QUEUE, jSONArray2);
            editorEdit.putString(DOWNLOAD_QUEUE, jSONObject2.toString());
        }
        editorEdit.commit();
        DebugLogger.D3(logname, "Next() finished");
        return jSONObject;
        DebugLogger.D2(logname, "JSONException:exception: " + e.toString());
        DebugLogger.D3(logname, "Next() finished");
        return jSONObject;
    }

    public synchronized void drop(int i) {
        JSONObject jSONObject;
        DebugLogger.D3(logname, "drop(), downloadId: " + i);
        SharedPreferences sharedPreferences = Application.anApplication.getSharedPreferences(DOWNLOADER_RECORDS, 0);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        String string = sharedPreferences.getString(DOWNLOAD_QUEUE, null);
        if (string == null) {
            DebugLogger.D2(logname, "download queue cannot be found");
            checkDownload();
            return;
        }
        int i2 = sharedPreferences.getInt(IN_PROGRESS_ID, -1);
        try {
            JSONObject jSONObject2 = new JSONObject(string);
            JSONArray jSONArray = jSONObject2.getJSONArray(QUEUE);
            JSONArray jSONArray2 = jSONObject2.getJSONArray(PACKAGES);
            JSONArray jSONArray3 = new JSONArray();
            int i3 = 0;
            while (i3 < jSONArray.length()) {
                JSONObject jSONObject3 = jSONArray.getJSONObject(i3);
                int i4 = jSONObject3.getInt(DOWNLOAD_ID);
                if (i4 == i) {
                    jSONObject = jSONObject2;
                    JSONArray jSONArraySubtractSizeFromPackage = subtractSizeFromPackage(jSONObject3.getString(TITLE), jSONObject3.getLong(SIZE), jSONArray2);
                    if (i == i2) {
                        DebugLogger.D3(logname, ".drop savedDownloadId:" + i4 + " - stop the running download task");
                        ((DownloadManager) Application.anApplication.getSystemService("download")).remove(sharedPreferences.getLong(REFERENCE_ID, -1L));
                        editorEdit.putLong(REFERENCE_ID, -1L);
                        i2 = -1;
                    } else {
                        DebugLogger.D3(logname, ".drop savedDownloadId:" + i4 + " - this task has been removed");
                    }
                    jSONArray2 = jSONArraySubtractSizeFromPackage;
                } else {
                    jSONObject = jSONObject2;
                    jSONArray3.put(jSONObject3);
                }
                i3++;
                jSONObject2 = jSONObject;
            }
            JSONObject jSONObject4 = jSONObject2;
            if (jSONArray.length() < 1) {
                DebugLogger.D2(logname, "drop() preferences cleared");
                editorEdit.clear();
            } else {
                jSONObject4.put(QUEUE, jSONArray3);
                jSONObject4.put(PACKAGES, jSONArray2);
                editorEdit.putInt(IN_PROGRESS_ID, i2);
                editorEdit.putString(DOWNLOAD_QUEUE, jSONObject4.toString());
            }
            editorEdit.commit();
            DebugLogger.D3(logname, "drop() after - inProgressId:" + i2);
            DebugLogger.D3(logname, "drop() DOWNLOAD_QUEUE jsonString after:" + jSONArray3.toString());
        } catch (JSONException e) {
            DebugLogger.D2(logname, "drop() JSONException:exception: " + e.toString());
        }
        checkDownload();
    }

    private JSONArray addSizeToPackage(String str, long j, JSONArray jSONArray) throws JSONException {
        DebugLogger.D4(logname, "addSizeToPackage() title:" + str + "size:" + j);
        JSONArray jSONArray2 = new JSONArray();
        boolean z = false;
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            if (jSONObject.getString(TITLE).equals(str)) {
                jSONObject.put(PACKAGE_SIZE, jSONObject.getLong(PACKAGE_SIZE) + j);
                z = true;
            }
            jSONArray2.put(jSONObject);
        }
        if (!z) {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(TITLE, str);
            jSONObject2.put(PACKAGE_SIZE, j);
            jSONArray2.put(jSONObject2);
        }
        return jSONArray2;
    }

    private JSONArray subtractSizeFromPackage(String str, long j, JSONArray jSONArray) throws JSONException {
        boolean z;
        DebugLogger.D4(logname, "subtractSizeFromPackage() title:" + str + "size:" + j);
        JSONArray jSONArray2 = new JSONArray();
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            if (jSONObject.getString(TITLE).equals(str)) {
                long j2 = jSONObject.getLong(PACKAGE_SIZE) - j;
                if (j2 > 0) {
                    jSONObject.put(PACKAGE_SIZE, j2);
                    z = true;
                } else {
                    z = false;
                }
            } else {
                z = true;
            }
            if (z) {
                jSONArray2.put(jSONObject);
            }
        }
        return jSONArray2;
    }

    private long getSizeOfPackage(String str, JSONArray jSONArray) throws JSONException {
        DebugLogger.D2(logname, "getSizeOfPackage() pkgName:" + str);
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            if (jSONObject.getString(TITLE).equals(str)) {
                return jSONObject.getLong(PACKAGE_SIZE);
            }
        }
        return 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00dd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public long sendProgressStatus() throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 237
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.sendProgressStatus():long");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e4 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:45:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public boolean updateNotification(long r19) {
        /*
            Method dump skipped, instruction units count: 238
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.updateNotification(long):boolean");
    }

    private Intent getMainActivityIntentWithShopExtra() {
        Intent mainActivityIntent = IgoActivity.getMainActivityIntent();
        if (mainActivityIntent != null) {
            mainActivityIntent.putExtra(ACTION_OPEN_SHOP, true);
        }
        return mainActivityIntent;
    }

    private void onNotificationClicked() {
        DebugLogger.D3(logname, "onNotificationClicked");
        Application.anApplication.startMainActivityInForeground();
        ((NotificationManager) Application.anApplication.getSystemService("notification")).cancel(1);
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.RUNNING, false, new Runnable() { // from class: com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.2
            @Override // java.lang.Runnable
            public void run() {
                AndroidGo.getInstance().callUI("sc_GoTo_Shop", null, new Object[0]);
            }
        });
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return intent != null && intent.getBooleanExtra(ACTION_OPEN_SHOP, false);
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        if (!matchesIntent(intent)) {
            return false;
        }
        onNotificationClicked();
        return true;
    }
}
