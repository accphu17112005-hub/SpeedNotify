package com.navngo.igo.javaclient.utils;

import com.android.volley.toolbox.HttpHeaderParser;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.OutArgs;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import java.io.BufferedInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyFactory;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManagerFactory;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AntHttpUtility implements IFunctorCollection {
    private static final int RESPONSE_BUFSIZE = 131072;
    private static final String logname = "AntHttpUtility";
    private int mRequestCounter = 1;
    private Map<Integer, Request> mRequestMap = new HashMap();
    private ThreadPoolExecutor mRequestPool = new ThreadPoolExecutor(4, 4, 1, TimeUnit.SECONDS, new ArrayBlockingQueue(100));
    private Object mSSLLock = new Object();
    private SSLContext mSSLContext = null;

    enum RequestStatus {
        QUEUED(1),
        WAITING_FOR_CONNECTION(2),
        CONNECTED(3),
        RECEIVING_RESPONSE(4),
        RESPONSE_READY(5),
        ERROR(6),
        UNKNOWN_REQUEST(7);

        private int value;

        RequestStatus(int i) {
            this.value = i;
        }

        public int getValue() {
            return this.value;
        }
    }

    private class HostBasedProxySelector extends ProxySelector {
        private final Pattern server_pattern;

        @Override // java.net.ProxySelector
        public void connectFailed(URI uri, SocketAddress socketAddress, IOException iOException) {
        }

        private HostBasedProxySelector() {
            this.server_pattern = Pattern.compile("^(.*):([0-9]+)$");
        }

        private Proxy createProxy(String str) {
            if (str == null || str.isEmpty()) {
                return Proxy.NO_PROXY;
            }
            Matcher matcher = this.server_pattern.matcher(str);
            if (!matcher.matches()) {
                throw new IllegalArgumentException("bad proxy server specification: " + str);
            }
            return new Proxy(Proxy.Type.HTTP, new InetSocketAddress(matcher.group(1), Integer.parseInt(matcher.group(2))));
        }

        @Override // java.net.ProxySelector
        public List<Proxy> select(URI uri) {
            ArrayList arrayList = new ArrayList(1);
            for (int i = 0; i < Config.android_proxy_patterns.length; i++) {
                DebugLogger.D5(AntHttpUtility.logname, "proxy check: matching " + uri.getHost() + " against " + Config.android_proxy_patterns[i]);
                if (Config.android_proxy_patterns[i].matcher(uri.getHost()).matches()) {
                    DebugLogger.D4(AntHttpUtility.logname, "proxy found for " + uri + ": " + Config.android_proxy_servers[i]);
                    arrayList.add(createProxy(Config.android_proxy_servers[i]));
                    return arrayList;
                }
            }
            arrayList.add(Proxy.NO_PROXY);
            return arrayList;
        }
    }

    public AntHttpUtility() {
        if (Config.android_proxy_patterns != null) {
            ProxySelector.setDefault(new HostBasedProxySelector());
        }
    }

    private class Request {
        public URLConnection mConnection;
        public int mId;
        public volatile RequestStatus mStatus;
        public HttpRequestRunnable mRunnable = null;
        public CircularByteBuffer mRequestData = new CircularByteBuffer(true);
        public CircularByteBuffer mResponseData = new CircularByteBuffer(131072);

        public Request(int i, URLConnection uRLConnection, RequestStatus requestStatus) {
            this.mId = i;
            this.mStatus = requestStatus;
            this.mConnection = uRLConnection;
        }

        public RequestStatus getStatus() {
            RequestStatus requestStatus;
            synchronized (this.mStatus) {
                requestStatus = this.mStatus;
            }
            return requestStatus;
        }

        public void setStatus(RequestStatus requestStatus) {
            synchronized (this.mStatus) {
                this.mStatus = requestStatus;
            }
        }

        public void callStatusCallback(RequestStatus requestStatus) {
            setStatus(requestStatus);
            DebugLogger.D4(AntHttpUtility.logname, "Setting status to " + requestStatus.getValue() + " for request id=" + this.mId);
            AndroidGo.getInstance().callIgo("other.http_status_callback", null, Integer.valueOf(this.mId), Integer.valueOf(requestStatus.getValue()));
        }
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.http.createRequest", this, "igoCreateRequest");
        androidGo.registerFunctor("android.http.addHeader", this, "igoAddHeader");
        androidGo.registerFunctor("android.http.addContentPiece", this, "igoAddContentPiece");
        androidGo.registerFunctor("android.http.killRequest", this, "igoKillRequest");
        androidGo.registerFunctor("android.http.getReply", this, "igoGetReply");
        androidGo.registerFunctor("android.http.getAllHeader", this, "igoGetAllHeader");
        androidGo.registerFunctor("android.http.getHeaderKeys", this, "igoGetHeaderKeys");
        androidGo.registerFunctor("android.http.getStatusCode", this, "igoGetStatusCode");
        androidGo.registerFunctor("android.http.getRequestStatus", this, "igoGetRequestStatus");
    }

    public void close() {
        Iterator<Integer> it = this.mRequestMap.keySet().iterator();
        while (it.hasNext()) {
            igoKillRequest(it.next().intValue());
        }
    }

    public int igoCreateRequest(String str, String str2) {
        int i;
        try {
            URLConnection uRLConnectionOpenConnection = new URL(str).openConnection();
            if ("POST".equals(str2)) {
                uRLConnectionOpenConnection.setRequestProperty(HttpHeaderParser.HEADER_CONTENT_TYPE, Config.def_additional_assets);
                uRLConnectionOpenConnection.setDoOutput(true);
            }
            synchronized (this.mRequestMap) {
                i = this.mRequestCounter;
                this.mRequestCounter = i + 1;
                this.mRequestMap.put(Integer.valueOf(i), new Request(i, uRLConnectionOpenConnection, RequestStatus.QUEUED));
                DebugLogger.D3(logname, "CreateRequest, id=" + i + ", inURL=" + str + ", RequestMethod=" + str2 + ".");
            }
            if ((uRLConnectionOpenConnection instanceof HttpsURLConnection) && Config.android_ssl_pinning) {
                setupSSL(i, (HttpsURLConnection) uRLConnectionOpenConnection);
            }
            return i;
        } catch (IOException e) {
            DebugLogger.D2(logname, "CreateRequest, Error during creating connection, " + e);
            return 0;
        }
    }

    Request getRequest(int i) {
        Request request;
        synchronized (this.mRequestMap) {
            request = this.mRequestMap.get(Integer.valueOf(i));
        }
        return request;
    }

    public void igoAddHeader(int i, String str, String str2) {
        DebugLogger.D4(logname, "AddHeader, id=" + i + ", Name=" + str + ", Value=" + str2);
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request " + i);
            return;
        }
        if (request.getStatus() != RequestStatus.QUEUED) {
            DebugLogger.D2(logname, "Too late to add header for request, id=" + i);
        }
        synchronized (request.mConnection) {
            request.mConnection.setRequestProperty(str, str2);
        }
    }

    public void igoAddContentPiece(int i, byte[] bArr, boolean z) {
        DebugLogger.D4(logname, "AddContentPiece, id=" + i + ", len(Data)=" + bArr.length + ", IsFinal=" + z);
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return;
        }
        if (bArr != null && bArr.length > 0) {
            synchronized (request.mConnection) {
                if (!request.mConnection.getDoOutput()) {
                    DebugLogger.D2(logname, "Cannot add content to a GET request: id=" + i);
                    return;
                }
                if (request.mRequestData.isOutputClosed() || request.getStatus() == RequestStatus.RESPONSE_READY || request.getStatus() == RequestStatus.ERROR) {
                    DebugLogger.D2(logname, "Cannot add content to this request anymore: id=" + i);
                    return;
                }
                try {
                    request.mRequestData.getOutputStream().write(bArr);
                    request.mRequestData.getOutputStream().flush();
                } catch (IOException e) {
                    DebugLogger.D2(logname, "Error during writing of request data, id=" + i + ", " + e);
                }
            }
        }
        if (z) {
            try {
                request.mRequestData.getOutputStream().close();
            } catch (IOException e2) {
                DebugLogger.D2(logname, "Error closing request data, id=" + i + ", " + e2);
            }
        }
        if (request.getStatus() == RequestStatus.QUEUED) {
            request.setStatus(RequestStatus.WAITING_FOR_CONNECTION);
            request.mRunnable = new HttpRequestRunnable(request);
            DebugLogger.D4(logname, "Executing request: id=" + i);
            this.mRequestPool.execute(request.mRunnable);
        }
    }

    public void igoKillRequest(int i) {
        Request request;
        DebugLogger.D3(logname, "KillRequest, id=" + i);
        synchronized (this.mRequestMap) {
            request = getRequest(i);
            this.mRequestMap.remove(Integer.valueOf(i));
        }
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return;
        }
        this.mRequestPool.remove(request.mRunnable);
        if (request.mRunnable != null) {
            request.mRunnable.terminate();
        }
        HttpURLConnection httpURLConnection = (HttpURLConnection) request.mConnection;
        if (httpURLConnection != null) {
            httpURLConnection.disconnect();
        }
        request.mRequestData.close();
        request.mResponseData.close();
    }

    public byte[] igoGetReply(int i) {
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return new byte[0];
        }
        try {
            int iAvailable = request.mResponseData.getInputStream().available();
            DebugLogger.D4(logname, "GetReply, id=" + i + ", available_bytes=" + iAvailable);
            byte[] bArr = new byte[iAvailable];
            if (iAvailable > 0) {
                request.mResponseData.getInputStream().read(bArr);
            }
            return bArr;
        } catch (IOException e) {
            DebugLogger.D2(logname, "Exception during reading from http request, id=" + i + ", " + e);
            return new byte[0];
        }
    }

    public byte[] igoGetAllHeader(int i) {
        Map<String, List<String>> headerFields;
        boolean zContainsKey;
        DebugLogger.D4(logname, "GetAllHeader, id=" + i);
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return new byte[0];
        }
        if (request.getStatus() != RequestStatus.RECEIVING_RESPONSE && request.getStatus() != RequestStatus.RESPONSE_READY) {
            DebugLogger.D2(logname, "Not recieved response yet, id=" + i);
            return new byte[0];
        }
        synchronized (request.mConnection) {
            headerFields = request.mConnection.getHeaderFields();
        }
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect();
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStreamDirect);
        try {
            zContainsKey = headerFields.containsKey(null);
        } catch (Exception unused) {
            zContainsKey = false;
        }
        try {
            dataOutputStream.writeInt(headerFields.size() - (zContainsKey ? 1 : 0));
            for (Map.Entry<String, List<String>> entry : headerFields.entrySet()) {
                if (entry.getKey() != null) {
                    dataOutputStream.writeUTF(entry.getKey());
                    dataOutputStream.writeInt(entry.getValue().size());
                    Iterator<String> it = entry.getValue().iterator();
                    while (it.hasNext()) {
                        dataOutputStream.writeUTF(it.next());
                    }
                }
            }
            return byteArrayOutputStreamDirect.getBuffer().buffer;
        } catch (Exception e) {
            DebugLogger.D2(logname, "Serializing headerMap failed, id=" + i + ", " + e);
            return new byte[0];
        }
    }

    public OutArgs igoGetHeaderKeys(int i) {
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request " + i);
            return new OutArgs(Config.def_additional_assets);
        }
        synchronized (request) {
            if (request.mStatus != RequestStatus.RECEIVING_RESPONSE && request.mStatus != RequestStatus.RESPONSE_READY) {
                DebugLogger.D2(logname, "Not recieved response yet " + i);
                return new OutArgs(Config.def_additional_assets);
            }
            Map<String, List<String>> headerFields = request.mConnection.getHeaderFields();
            String str = Config.def_additional_assets;
            for (String str2 : headerFields.keySet()) {
                if (str2 != null) {
                    str = str + str2 + ",";
                }
            }
            return new OutArgs(str);
        }
    }

    public int igoGetStatusCode(int i) {
        DebugLogger.D4(logname, "GetStatusCode, id=" + i);
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return 0;
        }
        if (request.getStatus() != RequestStatus.RECEIVING_RESPONSE && request.getStatus() != RequestStatus.RESPONSE_READY) {
            DebugLogger.D2(logname, "Not recieved response yet, id=" + i);
            return 0;
        }
        try {
        } catch (IOException e) {
            DebugLogger.D2(logname, "Exception during reading of response code id=" + i + ", " + e);
        }
        synchronized (request.mConnection) {
            if (!(request.mConnection instanceof HttpURLConnection)) {
                return 0;
            }
            return ((HttpURLConnection) request.mConnection).getResponseCode();
        }
    }

    public int igoGetRequestStatus(int i) {
        DebugLogger.D4(logname, "GetRequestStatus, id=" + i);
        Request request = getRequest(i);
        if (request == null) {
            DebugLogger.D2(logname, "Cannot find request, id=" + i);
            return RequestStatus.UNKNOWN_REQUEST.getValue();
        }
        return request.getStatus().getValue();
    }

    private void setupSSL(int i, HttpsURLConnection httpsURLConnection) {
        DebugLogger.D4(logname, "setting up SSL for request [" + i + "]");
        synchronized (this.mSSLLock) {
            if (this.mSSLContext == null) {
                try {
                    this.mSSLContext = createSSLContext();
                } catch (Exception e) {
                    DebugLogger.D2(logname, "couldn't set up pinned SSL context for request [" + i + "], using default context: " + e);
                }
            }
        }
        SSLContext sSLContext = this.mSSLContext;
        if (sSLContext != null) {
            httpsURLConnection.setSSLSocketFactory(sSLContext.getSocketFactory());
        }
    }

    private static Certificate loadCertificate(CertificateFactory certificateFactory, File file, String str) throws Throwable {
        BufferedInputStream bufferedInputStream = null;
        try {
            BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(file));
            try {
                Certificate certificateGenerateCertificate = certificateFactory.generateCertificate(bufferedInputStream2);
                bufferedInputStream2.close();
                DebugLogger.D4(logname, str + " certificate DN=" + ((X509Certificate) certificateGenerateCertificate).getSubjectDN());
                return certificateGenerateCertificate;
            } catch (Throwable th) {
                th = th;
                bufferedInputStream = bufferedInputStream2;
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private SSLContext createSSLContext() throws Throwable {
        byte[] bArr = new byte[4096];
        File file = new File(Config.serverFolder, Config.link_to_sdcard_igo_dir);
        BufferedInputStream bufferedInputStream = null;
        try {
            BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(new File(file, Config.android_ssl_client_key)));
            try {
                int i = bufferedInputStream2.read(bArr);
                if (i <= 0 || i >= 4096) {
                    throw new InvalidKeySpecException("private key has strange size: " + i);
                }
                bufferedInputStream2.close();
                PrivateKey privateKeyGeneratePrivate = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(bArr));
                CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                String str = Config.android_ssl_client_password;
                KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
                keyStore.load(null, null);
                for (String str2 : Config.android_ssl_trusted_certs) {
                    keyStore.setCertificateEntry(str2, loadCertificate(certificateFactory, new File(file, str2), str2));
                }
                keyStore.setEntry(Config.android_ssl_client_cert, new KeyStore.PrivateKeyEntry(privateKeyGeneratePrivate, new Certificate[]{loadCertificate(certificateFactory, new File(file, Config.android_ssl_client_cert), Config.android_ssl_client_cert)}), new KeyStore.PasswordProtection(str.toCharArray()));
                TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
                trustManagerFactory.init(keyStore);
                KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
                keyManagerFactory.init(keyStore, str.toCharArray());
                SSLContext sSLContext = SSLContext.getInstance("TLS");
                sSLContext.init(keyManagerFactory.getKeyManagers(), trustManagerFactory.getTrustManagers(), null);
                return sSLContext;
            } catch (Throwable th) {
                th = th;
                bufferedInputStream = bufferedInputStream2;
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private final class HttpRequestRunnable implements Runnable {
        private final Request mRequest;
        private volatile boolean mTerminate = false;

        public HttpRequestRunnable(Request request) {
            this.mRequest = request;
        }

        @Override // java.lang.Runnable
        public void run() {
            InputStream inputStream;
            int i;
            String str = "[id=" + this.mRequest.mId + "] ";
            DebugLogger.D4(AntHttpUtility.logname, str + "Start HTTP");
            try {
                DebugLogger.D4(AntHttpUtility.logname, str + "connecting");
                synchronized (this.mRequest.mConnection) {
                    this.mRequest.mConnection.connect();
                }
                if (this.mTerminate) {
                    ((HttpURLConnection) this.mRequest.mConnection).disconnect();
                    return;
                }
                if (this.mRequest.mConnection.getDoOutput()) {
                    try {
                        DebugLogger.D4(AntHttpUtility.logname, str + "getting output stream");
                        OutputStream outputStream = this.mRequest.mConnection.getOutputStream();
                        do {
                            byte[] bArr = new byte[4096];
                            try {
                                int i2 = this.mRequest.mRequestData.getInputStream().read(bArr);
                                if (this.mTerminate) {
                                    return;
                                }
                                if (i2 != -1) {
                                    DebugLogger.D4(AntHttpUtility.logname, str + "writing POST message. " + i2 + " bytes added. [" + this.mRequest.mId + "]");
                                    synchronized (outputStream) {
                                        outputStream.write(bArr, 0, i2);
                                    }
                                }
                            } catch (IOException e) {
                                DebugLogger.D2(AntHttpUtility.logname, str + "writing POST message [" + this.mRequest.mId + "] ERROR, " + e);
                                reportError();
                                return;
                            }
                        } while (!this.mTerminate);
                        return;
                    } catch (Exception e2) {
                        DebugLogger.D2(AntHttpUtility.logname, str + "getting failed [id=" + this.mRequest.mId + "]: getos: " + e2);
                        reportError();
                        return;
                    }
                }
                this.mRequest.callStatusCallback(RequestStatus.CONNECTED);
                try {
                    DebugLogger.D4(AntHttpUtility.logname, str + "Getting input stream");
                    if (this.mRequest.mConnection instanceof HttpURLConnection) {
                        HttpURLConnection httpURLConnection = (HttpURLConnection) this.mRequest.mConnection;
                        if (httpURLConnection.getResponseCode() >= 400) {
                            inputStream = httpURLConnection.getErrorStream();
                        } else {
                            inputStream = httpURLConnection.getInputStream();
                        }
                    } else {
                        DebugLogger.D3(AntHttpUtility.logname, str + "Not a HttpURLConnection (then what?), unknown response code");
                        inputStream = this.mRequest.mConnection.getInputStream();
                    }
                    DebugLogger.D4(AntHttpUtility.logname, str + "Getting input stream ok");
                    if (this.mTerminate) {
                        return;
                    }
                } catch (Exception e3) {
                    try {
                        InputStream errorStream = ((HttpURLConnection) this.mRequest.mConnection).getErrorStream();
                        if (this.mTerminate) {
                            return;
                        }
                        if (errorStream == null) {
                            DebugLogger.D2(AntHttpUtility.logname, str + "Getting input stream failed: " + e3);
                            reportError();
                            return;
                        }
                        inputStream = errorStream;
                    } catch (Exception e4) {
                        DebugLogger.D2(AntHttpUtility.logname, "Getting input stream failed: " + e4);
                        reportError();
                        return;
                    }
                }
                this.mRequest.callStatusCallback(RequestStatus.RECEIVING_RESPONSE);
                byte[] bArr2 = new byte[43690];
                int i3 = 0;
                while (true) {
                    try {
                        synchronized (inputStream) {
                            i = inputStream.read(bArr2);
                        }
                        if (this.mTerminate) {
                            return;
                        }
                        if (i == -1) {
                            this.mRequest.callStatusCallback(RequestStatus.RECEIVING_RESPONSE);
                            try {
                                this.mRequest.mResponseData.getOutputStream().close();
                            } catch (IOException e5) {
                                DebugLogger.D2(AntHttpUtility.logname, str + "Cannot close output stream [" + this.mRequest.mId + "] :o " + e5);
                            }
                            DebugLogger.D4(AntHttpUtility.logname, str + "Result stream closed " + this.mRequest.mId);
                            this.mRequest.callStatusCallback(RequestStatus.RESPONSE_READY);
                            try {
                                DebugLogger.D4(AntHttpUtility.logname, str + "Closing input [" + this.mRequest.mId + "]");
                                inputStream.close();
                                DebugLogger.D4(AntHttpUtility.logname, str + "Closing input done [" + this.mRequest.mId + "]");
                                return;
                            } catch (IOException e6) {
                                DebugLogger.D2(AntHttpUtility.logname, str + "Cannot close http connection [" + this.mRequest.mId + "] :o " + e6);
                                return;
                            }
                        }
                        DebugLogger.D4(AntHttpUtility.logname, str + "Got [" + this.mRequest.mId + "] response bytes: " + i);
                        i3 += i;
                        if (i3 >= 43690) {
                            DebugLogger.D4(AntHttpUtility.logname, str + "Notifying c++ side, accumulatedReadSize=" + i3);
                            this.mRequest.callStatusCallback(RequestStatus.RECEIVING_RESPONSE);
                            i3 = 0;
                        }
                        this.mRequest.mResponseData.getOutputStream().write(bArr2, 0, i);
                        DebugLogger.D4(AntHttpUtility.logname, str + "Response has been written to CircularBuffer");
                    } catch (IOException e7) {
                        DebugLogger.D2(AntHttpUtility.logname, str + "Receiving [" + this.mRequest.mId + "] response suxx: " + e7);
                        reportError();
                        return;
                    }
                }
            } catch (Exception e8) {
                DebugLogger.D2(AntHttpUtility.logname, str + "connect failed [id=" + this.mRequest.mId + "]: tryconnect: " + e8);
                reportError();
            }
        }

        private void reportError() {
            this.mRequest.callStatusCallback(RequestStatus.ERROR);
        }

        public void terminate() {
            DebugLogger.D2(AntHttpUtility.logname, "Request terminated, id=" + this.mRequest.mId);
            this.mTerminate = true;
        }
    }
}
