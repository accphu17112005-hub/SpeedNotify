package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.CString;
import com.navngo.igo.javaclient.androidgo.types.DateType;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.androidgo.types.TimeType;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AndroidGoOutputStream extends DataOutputStream {
    private static final String logname = "com.navngo.igo.javaclient.androidgo.AndroidGoOutputStream";

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
            writeByte(AndroidGo.ArgumentTypes.TYP_INT.ordinal());
            writeInt(((Integer) obj).intValue());
            return;
        }
        if (obj instanceof Boolean) {
            writeByte(AndroidGo.ArgumentTypes.TYP_BOOL.ordinal());
            writeBoolean(((Boolean) obj).booleanValue());
            return;
        }
        if (obj instanceof String) {
            writeByte(AndroidGo.ArgumentTypes.TYP_WSTRING.ordinal());
            writeUtf8((String) obj);
            return;
        }
        if (obj instanceof CString) {
            writeByte(AndroidGo.ArgumentTypes.TYP_CSTRING.ordinal());
            writeCString((CString) obj);
            return;
        }
        if (obj instanceof Long) {
            writeByte(AndroidGo.ArgumentTypes.TYP_QWORD.ordinal());
            writeLong(((Long) obj).longValue());
            return;
        }
        if (obj instanceof GCoor) {
            writeByte(AndroidGo.ArgumentTypes.TYP_GCOOR.ordinal());
            ((GCoor) obj).writeOut(this);
            return;
        }
        if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            writeByte(AndroidGo.ArgumentTypes.TYP_BUFFER.ordinal());
            writeInt(bArr.length);
            write(bArr);
            return;
        }
        if (obj instanceof ByteArrayOutputStreamDirect.ByteArrayRegion) {
            ByteArrayOutputStreamDirect.ByteArrayRegion byteArrayRegion = (ByteArrayOutputStreamDirect.ByteArrayRegion) obj;
            writeByte(AndroidGo.ArgumentTypes.TYP_BUFFER.ordinal());
            writeInt(byteArrayRegion.size);
            write(byteArrayRegion.buffer, 0, byteArrayRegion.size);
            return;
        }
        if (obj instanceof TimeType) {
            writeByte(AndroidGo.ArgumentTypes.TYP_TIMETYPE.ordinal());
            writeInt(((TimeType) obj).getMillisecFromMidnight());
            return;
        }
        if (obj instanceof DateType) {
            writeByte(AndroidGo.ArgumentTypes.TYP_DATETYPE.ordinal());
            DateType dateType = (DateType) obj;
            writeShort(dateType.getYear());
            writeByte(dateType.getMonth());
            writeByte(dateType.getDay());
            return;
        }
        if (obj instanceof Double) {
            writeByte(AndroidGo.ArgumentTypes.TYP_DOUBLE.ordinal());
            writeDouble(((Double) obj).doubleValue());
            return;
        }
        DebugLogger.D2(logname, "Unsupported argument type: " + obj.getClass().toString());
    }

    public void writeSupportedObjectType(Object obj) throws IOException {
        AndroidGo.ArgumentTypes supportedObjectType = AndroidGo.ArgumentTypes.getSupportedObjectType(obj);
        if (supportedObjectType != AndroidGo.ArgumentTypes.TYP_UNKNOWN) {
            writeByte(supportedObjectType.ordinal());
            return;
        }
        DebugLogger.D2(logname, "Unsupported argument type: " + obj.getClass().toString());
    }
}
