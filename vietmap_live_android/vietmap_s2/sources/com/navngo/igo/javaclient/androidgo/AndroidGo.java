package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.ServerRunner;
import com.navngo.igo.javaclient.androidgo.types.CString;
import com.navngo.igo.javaclient.androidgo.types.DateType;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.androidgo.types.TimeType;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AndroidGo {
    private static final String logname = "com.navngo.igo.javaclient.androidgo.AndroidGo";
    private static AndroidGo sInstance;
    private Batch mCurrentBatch;
    private LinkedBlockingQueue<Runnable> mIgoMainThreadTasks = new LinkedBlockingQueue<>();
    private List<IAction> mActions = new ArrayList();
    private Map<String, GeneralFunctor> mFunctors = new HashMap();

    interface IAction {
        void doAction();
    }

    public interface IActionSucceeded {
        void actionSucceeded(String str, boolean z);
    }

    public static AndroidGo getInstance() {
        if (sInstance == null) {
            sInstance = new AndroidGo();
        }
        return sInstance;
    }

    public static void destroy() {
        AndroidGo androidGo = sInstance;
        if (androidGo != null) {
            synchronized (androidGo) {
                androidGo.mActions.clear();
                androidGo.mFunctors.clear();
                androidGo.mCurrentBatch = null;
            }
            sInstance = null;
        }
    }

    public void callIgo(String str, IActionSucceeded iActionSucceeded, Object... objArr) {
        addAction(new IgoCallAction(str, iActionSucceeded, this.mCurrentBatch, false, objArr));
    }

    public boolean callIgoSync(String str, Object... objArr) {
        if (!ServerRunner.isEngineCallable()) {
            DebugLogger.D2(logname, "Cannot call callIgoSync now: " + str);
            return false;
        }
        IgoCallAction igoCallAction = new IgoCallAction(str, null, this.mCurrentBatch, true, objArr);
        igoCallAction.doAction();
        return igoCallAction.getSuccess();
    }

    public void callUI(String str, IActionSucceeded iActionSucceeded, Object... objArr) {
        addAction(new UiCallAction(str, iActionSucceeded, this.mCurrentBatch, objArr));
    }

    public void startBatch(IActionSucceeded iActionSucceeded) {
        this.mCurrentBatch = new Batch(iActionSucceeded);
    }

    public void endBatch() {
        Batch batch = this.mCurrentBatch;
        if (batch != null) {
            batch.end();
            this.mCurrentBatch = null;
        }
    }

    public SysConfig getSysConfig() {
        return SysConfig.getInstance();
    }

    public void runOnIgoMainThread(Runnable runnable) {
        this.mIgoMainThreadTasks.add(runnable);
    }

    public synchronized void process() {
        Iterator<IAction> it = this.mActions.iterator();
        while (it.hasNext()) {
            it.next().doAction();
        }
        this.mActions.clear();
    }

    public synchronized boolean hasActionsToProcess() {
        return this.mActions.size() > 0;
    }

    public final void registerFunctor(String str, Object obj, String str2) {
        GeneralFunctor generalFunctor = new GeneralFunctor(str, obj, str2);
        if (this.mFunctors.get(str) != null) {
            DebugLogger.D2(logname, String.format("WARNING: functor %s is already registered !", str));
        }
        this.mFunctors.put(str, generalFunctor);
    }

    public Object callFunctor(String str, Object... objArr) {
        GeneralFunctor generalFunctor = this.mFunctors.get(str);
        if (generalFunctor != null) {
            return generalFunctor.call(objArr);
        }
        DebugLogger.D2(logname, String.format("WARNING: functor %s doesn't exist !", str));
        return null;
    }

    public ByteArrayOutputStreamDirect.ByteArrayRegion callFunctor(String str, InputStream inputStream) throws IOException {
        GeneralFunctor generalFunctor = this.mFunctors.get(str);
        if (generalFunctor == null) {
            DebugLogger.D2(logname, String.format("WARNING: functor %s doesn't exist !", str));
            return null;
        }
        try {
            AndroidGoInputStream androidGoInputStream = new AndroidGoInputStream(inputStream);
            int i = androidGoInputStream.readShort();
            Class<?>[] parameterTypes = generalFunctor.getParameterTypes();
            Class cls = parameterTypes.length > 0 ? parameterTypes[parameterTypes.length - 1] : Object.class;
            Object[] objArr = new Object[i];
            int length = parameterTypes.length - 1;
            if (cls.isArray()) {
                objArr = new Object[parameterTypes.length];
                objArr[length] = Array.newInstance(cls.getComponentType(), i >= parameterTypes.length ? (i - parameterTypes.length) + 1 : 0);
            }
            for (int i2 = 0; i2 < i; i2++) {
                AndroidGoObject supportedObject = androidGoInputStream.readSupportedObject();
                if (i2 < parameterTypes.length) {
                    if (supportedObject.type == ArgumentTypes.TYP_QWORD) {
                        if (parameterTypes[i2].equals(GCoor.class)) {
                            supportedObject.type = ArgumentTypes.TYP_GCOOR;
                            supportedObject.value = new GCoor(((Long) supportedObject.value).longValue());
                        }
                    } else if (supportedObject.type == ArgumentTypes.TYP_INT) {
                        if (parameterTypes[i2].equals(TimeType.class)) {
                            supportedObject.type = ArgumentTypes.TYP_TIMETYPE;
                            supportedObject.value = new TimeType(((Integer) supportedObject.value).intValue());
                        } else if (parameterTypes[i2].equals(DateType.class)) {
                            supportedObject.type = ArgumentTypes.TYP_DATETYPE;
                            supportedObject.value = DateType.createFromIgoInt(((Integer) supportedObject.value).intValue());
                        }
                    }
                }
                if (supportedObject.type != ArgumentTypes.TYP_BUFFER && cls.isArray() && i2 >= length) {
                    Array.set(objArr[length], i2 - length, supportedObject.value);
                } else {
                    objArr[i2] = supportedObject.value;
                }
            }
            Object objCall = generalFunctor.call(objArr);
            if (objCall instanceof OutArgs) {
                return buildArgsBuffer(((OutArgs) objCall).getValues());
            }
            if (objCall != null) {
                return buildArgsBuffer(objCall);
            }
            return null;
        } catch (Exception e) {
            DebugLogger.D1(logname, String.format("callFunctor: '%s'. exception catched:", str), e);
            return null;
        }
    }

    Batch getCurrentBatch() {
        return this.mCurrentBatch;
    }

    enum ArgumentTypes {
        TYP_INT,
        TYP_BOOL,
        TYP_DOUBLE,
        TYP_CSTRING,
        TYP_WSTRING,
        TYP_QWORD,
        TYP_GCOOR,
        TYP_TIMETYPE,
        TYP_DATETYPE,
        TYP_DATETIMETYPE,
        TYP_TIMESPAN,
        TYP_BUFFER,
        TYP_UNKNOWN;

        static final ArgumentTypes getTypeByCode(int i) {
            if (i >= 0 && i < values().length) {
                return values()[i];
            }
            return TYP_UNKNOWN;
        }

        static final ArgumentTypes getSupportedObjectType(Object obj) {
            ArgumentTypes argumentTypes = TYP_UNKNOWN;
            if (obj instanceof Integer) {
                return TYP_INT;
            }
            if (obj instanceof Boolean) {
                return TYP_BOOL;
            }
            if (obj instanceof String) {
                return TYP_WSTRING;
            }
            if (obj instanceof CString) {
                return TYP_CSTRING;
            }
            if (obj instanceof Long) {
                return TYP_QWORD;
            }
            if (obj instanceof GCoor) {
                return TYP_GCOOR;
            }
            if (obj instanceof byte[]) {
                return TYP_BUFFER;
            }
            return obj instanceof TimeType ? TYP_TIMETYPE : argumentTypes;
        }
    }

    private AndroidGo() {
    }

    void addAction(IAction iAction) {
        synchronized (this) {
            addTaskToCurrentBatch();
            this.mActions.add(iAction);
        }
        ServerRunner.notifyStatusThread();
    }

    private void addTaskToCurrentBatch() {
        Batch batch = this.mCurrentBatch;
        if (batch != null) {
            batch.startTask();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ByteArrayOutputStreamDirect.ByteArrayRegion buildArgsBuffer(Object... objArr) throws IOException {
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect((objArr.length * 4) + 2);
        AndroidGoOutputStream androidGoOutputStream = new AndroidGoOutputStream(byteArrayOutputStreamDirect);
        androidGoOutputStream.writeShort(objArr.length);
        for (int i = 0; i < objArr.length; i++) {
            androidGoOutputStream.writeShort(0);
        }
        for (int i2 = 0; i2 < objArr.length; i2++) {
            byte[] bArr = byteArrayOutputStreamDirect.getBuffer().buffer;
            int i3 = (i2 * 2) + 2;
            bArr[i3] = (byte) ((androidGoOutputStream.size() >> 8) & 255);
            bArr[i3 + 1] = (byte) (androidGoOutputStream.size() & 255);
            androidGoOutputStream.writeSupportedObject(objArr[i2]);
        }
        androidGoOutputStream.flush();
        androidGoOutputStream.close();
        return byteArrayOutputStreamDirect.getBuffer();
    }

    class IgoCallAction implements IAction {
        private Object[] mArgs;
        private Batch mBatch;
        private String mFuncName;
        private boolean mSuccess = false;
        private IActionSucceeded mSuccessCallback;
        private boolean mSynchronous;

        public IgoCallAction(String str, IActionSucceeded iActionSucceeded, Batch batch, boolean z, Object... objArr) {
            this.mFuncName = str;
            this.mSuccessCallback = iActionSucceeded;
            this.mArgs = objArr;
            this.mBatch = batch;
            this.mSynchronous = z;
        }

        @Override // com.navngo.igo.javaclient.androidgo.AndroidGo.IAction
        public void doAction() {
            try {
                ByteArrayOutputStreamDirect.ByteArrayRegion byteArrayRegionBuildArgsBuffer = AndroidGo.this.buildArgsBuffer(this.mArgs);
                this.mSuccess = NNG.callIgo(this.mFuncName, this.mSuccessCallback, byteArrayRegionBuildArgsBuffer.buffer, byteArrayRegionBuildArgsBuffer.size, this.mBatch, false, this.mSynchronous);
            } catch (Exception e) {
                DebugLogger.D1(AndroidGo.logname, "IgoCallAction: Exception while doing iGoCall: ", e);
                IActionSucceeded iActionSucceeded = this.mSuccessCallback;
                if (iActionSucceeded != null) {
                    iActionSucceeded.actionSucceeded(this.mFuncName, false);
                }
                Batch batch = this.mBatch;
                if (batch != null) {
                    batch.taskCompleted(false);
                }
                this.mSuccess = false;
            }
        }

        public boolean getSuccess() {
            return this.mSuccess;
        }
    }

    class UiCallAction implements IAction {
        private Object[] mArgs;
        private Batch mBatch;
        private String mScriptName;
        private IActionSucceeded mSuccessCallback;

        public UiCallAction(String str, IActionSucceeded iActionSucceeded, Batch batch, Object... objArr) {
            this.mScriptName = str;
            this.mSuccessCallback = iActionSucceeded;
            this.mBatch = batch;
            this.mArgs = objArr;
        }

        @Override // com.navngo.igo.javaclient.androidgo.AndroidGo.IAction
        public void doAction() {
            ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect();
            AndroidGoOutputStream androidGoOutputStream = new AndroidGoOutputStream(byteArrayOutputStreamDirect);
            try {
                DebugLogger.D5(AndroidGo.logname, "AndroidGo UICall " + this.mScriptName);
                androidGoOutputStream.writeShort(this.mArgs.length);
                for (Object obj : this.mArgs) {
                    androidGoOutputStream.writeSupportedObject(obj);
                }
                androidGoOutputStream.flush();
                ByteArrayOutputStreamDirect.ByteArrayRegion buffer = byteArrayOutputStreamDirect.getBuffer();
                NNG.callIgo(this.mScriptName, this.mSuccessCallback, buffer.buffer, buffer.size, this.mBatch, true, false);
            } catch (Exception e) {
                DebugLogger.D2(AndroidGo.logname, "UiCallAction: Problem while performing Ui call", e);
                Batch batch = this.mBatch;
                if (batch != null) {
                    batch.taskCompleted(false);
                }
                String str = this.mScriptName;
                if (str != null) {
                    this.mSuccessCallback.actionSucceeded(str, false);
                }
            }
        }
    }

    private static void onIgoMainThreadLogic() {
        getInstance().onLogic();
    }

    private void onLogic() {
        ArrayList arrayList = new ArrayList();
        if (this.mIgoMainThreadTasks.drainTo(arrayList) == 0) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
    }

    public static class AndroidGoOutputStream extends DataOutputStream {
        private static final String logname = "com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoOutputStream";

        public AndroidGoOutputStream(OutputStream outputStream) {
            super(outputStream);
        }

        public void writeCString(CString cString) throws IOException {
            writeShort(cString.length());
            for (int i = 0; i < cString.length(); i++) {
                writeByte(cString.charAt(i) & 255);
            }
        }

        public void writeString(String str) throws IOException {
            writeShort(str.length());
            for (int i = 0; i < str.length(); i++) {
                writeByte(str.charAt(i) & 255);
            }
        }

        public void writeUtf8(String str) throws IOException {
            StreamUtility.writeUtf8(str, this);
        }

        public void writeSupportedObject(Object obj) throws IOException {
            if (obj instanceof Integer) {
                writeByte(ArgumentTypes.TYP_INT.ordinal());
                writeInt(((Integer) obj).intValue());
                return;
            }
            if (obj instanceof Boolean) {
                writeByte(ArgumentTypes.TYP_BOOL.ordinal());
                writeBoolean(((Boolean) obj).booleanValue());
                return;
            }
            if (obj instanceof String) {
                writeByte(ArgumentTypes.TYP_WSTRING.ordinal());
                writeUtf8((String) obj);
                return;
            }
            if (obj instanceof CString) {
                writeByte(ArgumentTypes.TYP_CSTRING.ordinal());
                writeCString((CString) obj);
                return;
            }
            if (obj instanceof Long) {
                writeByte(ArgumentTypes.TYP_QWORD.ordinal());
                writeLong(((Long) obj).longValue());
                return;
            }
            if (obj instanceof GCoor) {
                writeByte(ArgumentTypes.TYP_GCOOR.ordinal());
                ((GCoor) obj).writeOut(this);
                return;
            }
            if (obj instanceof byte[]) {
                byte[] bArr = (byte[]) obj;
                writeByte(ArgumentTypes.TYP_BUFFER.ordinal());
                writeInt(bArr.length);
                write(bArr);
                return;
            }
            if (obj instanceof ByteArrayOutputStreamDirect.ByteArrayRegion) {
                ByteArrayOutputStreamDirect.ByteArrayRegion byteArrayRegion = (ByteArrayOutputStreamDirect.ByteArrayRegion) obj;
                writeByte(ArgumentTypes.TYP_BUFFER.ordinal());
                writeInt(byteArrayRegion.size);
                write(byteArrayRegion.buffer, 0, byteArrayRegion.size);
                return;
            }
            if (obj instanceof TimeType) {
                writeByte(ArgumentTypes.TYP_TIMETYPE.ordinal());
                writeInt(((TimeType) obj).getMillisecFromMidnight());
                return;
            }
            if (obj instanceof DateType) {
                writeByte(ArgumentTypes.TYP_DATETYPE.ordinal());
                DateType dateType = (DateType) obj;
                writeShort(dateType.getYear());
                writeByte(dateType.getMonth());
                writeByte(dateType.getDay());
                return;
            }
            if (obj instanceof Double) {
                writeByte(ArgumentTypes.TYP_DOUBLE.ordinal());
                writeDouble(((Double) obj).doubleValue());
            } else {
                if (obj == null) {
                    DebugLogger.D2(logname, "Can't write out null argument");
                    return;
                }
                DebugLogger.D2(logname, "Unsupported argument type: " + obj.getClass().toString());
            }
        }

        public void writeSupportedObjectType(Object obj) throws IOException {
            ArgumentTypes supportedObjectType = ArgumentTypes.getSupportedObjectType(obj);
            if (supportedObjectType != ArgumentTypes.TYP_UNKNOWN) {
                writeByte(supportedObjectType.ordinal());
                return;
            }
            DebugLogger.D2(logname, "Unsupported argument type: " + obj.getClass().toString());
        }
    }

    static class AndroidGoObject {
        public ArgumentTypes type;
        public Object value;

        AndroidGoObject() {
        }
    }

    static class AndroidGoInputStream extends DataInputStream {
        public AndroidGoInputStream(InputStream inputStream) {
            super(inputStream);
        }

        public String readUtf8() throws IOException {
            int i = readShort();
            byte[] bArr = new byte[i];
            readFully(bArr, 0, i);
            try {
                return new String(bArr, 0, i, "UTF-8");
            } catch (Exception unused) {
                DebugLogger.D3(getClass().toString(), "readUtf8, cant decode string to UTF-8");
                return Config.def_additional_assets;
            }
        }

        public String readCString() throws IOException {
            int i = readShort();
            byte[] bArr = new byte[i];
            readFully(bArr, 0, i);
            try {
                return new String(bArr, 0, i, "US-ASCII");
            } catch (Exception unused) {
                DebugLogger.D3(getClass().toString(), "readCString, cant decode string to US-ASCII");
                return Config.def_additional_assets;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:15:0x005f  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        public com.navngo.igo.javaclient.androidgo.AndroidGo.AndroidGoObject readSupportedObject() throws java.io.IOException {
            /*
                Method dump skipped, instruction units count: 234
                To view this dump change 'Code comments level' option to 'DEBUG'
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.androidgo.AndroidGo.AndroidGoInputStream.readSupportedObject():com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoObject");
        }
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.androidgo.AndroidGo$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes;

        static {
            int[] iArr = new int[ArgumentTypes.values().length];
            $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes = iArr;
            try {
                iArr[ArgumentTypes.TYP_BOOL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_INT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_QWORD.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_DOUBLE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_WSTRING.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_CSTRING.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_GCOOR.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_TIMETYPE.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_DATETYPE.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_BUFFER.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes[ArgumentTypes.TYP_UNKNOWN.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
        }
    }
}
