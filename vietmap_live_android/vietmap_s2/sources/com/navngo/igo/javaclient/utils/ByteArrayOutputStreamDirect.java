package com.navngo.igo.javaclient.utils;

import java.io.ByteArrayOutputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ByteArrayOutputStreamDirect extends ByteArrayOutputStream {
    public ByteArrayOutputStreamDirect() {
    }

    public ByteArrayOutputStreamDirect(int i) {
        super(i);
    }

    public static class ByteArrayRegion {
        public byte[] buffer;
        public int size;

        public ByteArrayRegion(byte[] bArr, int i) {
            this.buffer = bArr;
            this.size = i;
        }
    }

    public synchronized ByteArrayRegion getBuffer() {
        return new ByteArrayRegion(this.buf, this.count);
    }
}
