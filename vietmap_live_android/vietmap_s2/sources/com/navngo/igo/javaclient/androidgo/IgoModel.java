package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.DateType;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.androidgo.types.TimeType;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import java.io.ByteArrayInputStream;
import java.io.IOException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IgoModel<T> {
    public static final IgoModel<?> ROOT_MODEL = new IgoModel<>(Config.def_additional_assets, AndroidGo.ArgumentTypes.TYP_UNKNOWN);
    private static final String logname = "IgoModel";
    String mModelPath;
    AndroidGo.ArgumentTypes mType;

    public static abstract class IViewer<T> {
        private int mHandle;

        public final void destroy() {
        }

        public abstract void update(IgoModel<T> igoModel);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private T unchecked_cast(Object obj) {
        return obj;
    }

    public void addViewer(IViewer<T> iViewer) {
    }

    public void clearViewers() {
    }

    public void removeViewer(IViewer<T> iViewer) {
    }

    IgoModel(String str, AndroidGo.ArgumentTypes argumentTypes) {
        this.mModelPath = str;
        this.mType = argumentTypes;
    }

    public T get() {
        T tUnchecked_cast = null;
        if (this.mType == AndroidGo.ArgumentTypes.TYP_UNKNOWN) {
            return null;
        }
        byte[] bArrQueryModelValue = NNG.queryModelValue(this, this.mModelPath, (byte) this.mType.ordinal());
        if (bArrQueryModelValue == null) {
            throw new RuntimeException(String.format("ERROR while getting value of model '%s'", this.mModelPath));
        }
        AndroidGo.AndroidGoInputStream androidGoInputStream = new AndroidGo.AndroidGoInputStream(new ByteArrayInputStream(bArrQueryModelValue));
        try {
            try {
                tUnchecked_cast = unchecked_cast(androidGoInputStream.readSupportedObject().value);
            } finally {
                try {
                    androidGoInputStream.close();
                } catch (IOException unused) {
                }
            }
        } catch (Exception e) {
            DebugLogger.D1(logname, String.format("ERROR while getting value of model '%s'", this.mModelPath), e);
        }
        return tUnchecked_cast;
    }

    public void set(T t) {
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect();
        AndroidGo.AndroidGoOutputStream androidGoOutputStream = new AndroidGo.AndroidGoOutputStream(byteArrayOutputStreamDirect);
        try {
            try {
                androidGoOutputStream.writeSupportedObject(t);
                ByteArrayOutputStreamDirect.ByteArrayRegion buffer = byteArrayOutputStreamDirect.getBuffer();
                NNG.setModelValue(this, this.mModelPath, buffer.buffer, buffer.size);
            } catch (Exception e) {
                DebugLogger.D1(logname, String.format("ERROR while setting value of model '%s'", this.mModelPath), e);
            }
        } finally {
            try {
                androidGoOutputStream.close();
            } catch (IOException unused) {
            }
        }
    }

    public IgoModel<Integer> getIntModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_INT);
    }

    public IgoModel<Boolean> getBoolModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_BOOL);
    }

    public IgoModel<Long> getQwordModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_QWORD);
    }

    public IgoModel<Double> getDoubleModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_DOUBLE);
    }

    public IgoModel<DateType> getDateModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_DATETYPE);
    }

    public IgoModel<TimeType> getTimeModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_TIMETYPE);
    }

    public IgoModel<String> getStringModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_WSTRING);
    }

    public IgoModel<String> getCStringModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_CSTRING);
    }

    public IgoModel<GCoor> getGcoorModel(String str) {
        return new IgoModel<>(this.mModelPath + str, AndroidGo.ArgumentTypes.TYP_GCOOR);
    }
}
