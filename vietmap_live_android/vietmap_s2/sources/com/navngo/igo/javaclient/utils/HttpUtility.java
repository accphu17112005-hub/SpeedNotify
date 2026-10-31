package com.navngo.igo.javaclient.utils;

import com.android.volley.toolbox.HttpHeaderParser;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.ServerRunner;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.LinkedList;
import java.util.Queue;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class HttpUtility {
    private static final String logname = "HttpUtility";
    private Thread httpRequestThread = null;
    private boolean stopRequestThread = false;
    private final Queue<Runnable> requestQueue = new LinkedList();
    private final String httpLock = new String("httpLock");
    private int successCount = 0;
    private int failCount = 0;

    static /* synthetic */ int access$308(HttpUtility httpUtility) {
        int i = httpUtility.successCount;
        httpUtility.successCount = i + 1;
        return i;
    }

    static /* synthetic */ int access$408(HttpUtility httpUtility) {
        int i = httpUtility.failCount;
        httpUtility.failCount = i + 1;
        return i;
    }

    public void getHttpRequest(String str, byte[] bArr, String str2, int i) {
        synchronized (this.httpLock) {
            this.requestQueue.add(new HttpRequestRunnable(str, bArr, str2, i));
            if (this.httpRequestThread == null) {
                Thread thread = new Thread("httpRequestThread") { // from class: com.navngo.igo.javaclient.utils.HttpUtility.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        Runnable runnable;
                        while (!HttpUtility.this.stopRequestThread) {
                            synchronized (HttpUtility.this.httpLock) {
                                runnable = (Runnable) HttpUtility.this.requestQueue.poll();
                                if (runnable == null) {
                                    try {
                                        HttpUtility.this.httpLock.wait();
                                    } catch (InterruptedException unused) {
                                    }
                                }
                            }
                            if (runnable != null) {
                                runnable.run();
                            }
                        }
                    }
                };
                this.httpRequestThread = thread;
                thread.start();
            }
            this.httpLock.notify();
        }
    }

    public void close() {
        synchronized (this.httpLock) {
            this.stopRequestThread = true;
            Thread thread = this.httpRequestThread;
            if (thread != null) {
                thread.interrupt();
            }
            this.httpLock.notify();
        }
    }

    private final class HttpRequestRunnable implements Runnable {
        private final String contentType;
        private final byte[] postData;
        private final int requestHandle;
        private final String url;
        private URLConnection urlConnection = null;
        private InputStream is = null;
        private final int engineIndex = ServerRunner.getEngineIndex();

        public HttpRequestRunnable(String str, byte[] bArr, String str2, int i) {
            this.requestHandle = i;
            this.url = str;
            this.postData = bArr;
            this.contentType = str2;
        }

        private boolean tryconnect() {
            try {
                this.urlConnection = new URL(this.url).openConnection();
                byte[] bArr = this.postData;
                if (bArr != null && bArr.length > 0) {
                    String str = new String(bArr, "UTF-8");
                    this.urlConnection.setDoOutput(true);
                    this.urlConnection.setRequestProperty("METHOD", "POST");
                    this.urlConnection.setRequestProperty(HttpHeaderParser.HEADER_CONTENT_TYPE, this.contentType);
                    this.urlConnection.setRequestProperty("Content-Length", Integer.toString(str.getBytes("UTF-8").length));
                    OutputStreamWriter outputStreamWriter = new OutputStreamWriter(this.urlConnection.getOutputStream());
                    outputStreamWriter.write(str);
                    DebugLogger.D5(HttpUtility.logname, "HTTP/POST " + this.url + " type= " + this.contentType + " POST:'" + str);
                    outputStreamWriter.flush();
                }
                this.is = this.urlConnection.getInputStream();
                return true;
            } catch (Exception e) {
                DebugLogger.D2(HttpUtility.logname, "[" + this.requestHandle + "]: tryconnect: " + e.getMessage());
                StringBuilder sb = new StringBuilder();
                sb.append("url:");
                sb.append(this.url);
                sb.append(" postData.length=");
                byte[] bArr2 = this.postData;
                sb.append(bArr2 == null ? -1 : bArr2.length);
                DebugLogger.D2(HttpUtility.logname, sb.toString());
                StringWriter stringWriter = new StringWriter();
                e.printStackTrace(new PrintWriter(stringWriter));
                DebugLogger.D2(HttpUtility.logname, stringWriter.toString());
                disconnect();
                return false;
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            DebugLogger.D5(HttpUtility.logname, "Start HTTP [" + this.requestHandle + "]: " + this.url);
            byte[] inputStream = null;
            try {
                if (tryconnect()) {
                    try {
                        inputStream = StreamUtility.readInputStream(this.is, 4096);
                    } catch (Exception e) {
                        DebugLogger.D2(HttpUtility.logname, "[" + this.requestHandle + "]: on reading:" + e.getMessage());
                        reportRequest(-1, null);
                    }
                }
                reportRequest(inputStream != null ? inputStream.length : -1, inputStream);
            } finally {
                disconnect();
            }
        }

        private void reportRequest(final int i, final byte[] bArr) {
            if (i > 0) {
                HttpUtility.access$308(HttpUtility.this);
            } else {
                HttpUtility.access$408(HttpUtility.this);
            }
            synchronized (HttpUtility.this.httpLock) {
                if (HttpUtility.this.stopRequestThread) {
                    DebugLogger.D4(HttpUtility.logname, "[" + this.requestHandle + "]: dropping result, closing");
                    return;
                }
                ServerRunner.callNNG(new Runnable() { // from class: com.navngo.igo.javaclient.utils.HttpUtility.HttpRequestRunnable.1
                    @Override // java.lang.Runnable
                    public void run() {
                        NNG.putHttpBuffer(HttpRequestRunnable.this.requestHandle, bArr, i);
                    }
                }, this.engineIndex);
                DebugLogger.D5(HttpUtility.logname, "[" + this.requestHandle + "]: NNG.putHttpBuffer: dataLength = " + i);
                StringBuilder sb = new StringBuilder();
                sb.append(HttpUtility.this.successCount);
                sb.append(" HTTP requests succeeded of ");
                sb.append(HttpUtility.this.successCount + HttpUtility.this.failCount);
                DebugLogger.D5(HttpUtility.logname, sb.toString());
            }
        }

        private void disconnect() {
            try {
                InputStream inputStream = this.is;
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (Exception e) {
                DebugLogger.D2(HttpUtility.logname, "[" + this.requestHandle + "]: disconnect: " + e.getMessage());
            }
        }
    }
}
