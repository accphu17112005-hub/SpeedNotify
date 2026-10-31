package com.navngo.igo.javaclient.androidgo.types;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CString implements CharSequence {
    private String mStr;

    public CString(String str) {
        ByteBuffer byteBufferEncode = Charset.forName("US-ASCII").encode(str);
        byte[] bArrArray = byteBufferEncode.array();
        if (bArrArray != null) {
            try {
                this.mStr = new String(bArrArray, 0, byteBufferEncode.limit(), "US-ASCII");
            } catch (Exception unused) {
            }
        }
        if (this.mStr == null) {
            this.mStr = str;
        }
    }

    @Override // java.lang.CharSequence
    public int length() {
        return this.mStr.length();
    }

    @Override // java.lang.CharSequence
    public char charAt(int i) {
        return this.mStr.charAt(i);
    }

    @Override // java.lang.CharSequence
    public CharSequence subSequence(int i, int i2) {
        return this.mStr.subSequence(i, i2);
    }

    @Override // java.lang.CharSequence
    public String toString() {
        return this.mStr;
    }
}
