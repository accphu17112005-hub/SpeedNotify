package com.navngo.igo.javaclient.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CircularByteBuffer {
    private static final int DEFAULT_BUFFER_CAPACITY = 1024;
    private byte[] mBuffer;
    protected final CircularByteBufferInputStream mInStream;
    protected volatile boolean mInfinite;
    protected final CircularByteBufferOutputStream mOutStream;
    protected volatile int mReadPos;
    protected volatile int mWritePos;

    public CircularByteBuffer() {
        this(1024);
    }

    public CircularByteBuffer(boolean z) {
        this(1024, z);
    }

    public CircularByteBuffer(int i) {
        this(i, false);
    }

    public CircularByteBuffer(int i, boolean z) {
        this.mInStream = new CircularByteBufferInputStream();
        this.mOutStream = new CircularByteBufferOutputStream();
        this.mReadPos = 0;
        this.mWritePos = 0;
        this.mInfinite = false;
        this.mBuffer = new byte[i];
        this.mInfinite = z;
    }

    public void close() {
        synchronized (this) {
            this.mInStream.isClosed = true;
            this.mOutStream.isClosed = true;
            notifyAll();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void growBuffer() {
        synchronized (this) {
            int length = this.mBuffer.length * 2;
            byte[] bArr = new byte[length];
            if (this.mReadPos <= this.mWritePos) {
                System.arraycopy(this.mBuffer, this.mReadPos, bArr, 0, this.mBuffer.length - this.mReadPos);
                this.mWritePos -= this.mReadPos;
                this.mReadPos = 0;
            } else {
                System.arraycopy(this.mBuffer, 0, bArr, 0, this.mWritePos);
                int length2 = length - (this.mBuffer.length - this.mReadPos);
                System.arraycopy(this.mBuffer, this.mReadPos, bArr, length2, this.mBuffer.length - this.mReadPos);
                this.mReadPos = length2;
            }
            this.mBuffer = bArr;
            notifyAll();
        }
    }

    public int getBufferSize() {
        int length;
        synchronized (this) {
            length = this.mBuffer.length;
        }
        return length;
    }

    public boolean isOutputClosed() {
        return this.mOutStream.isClosed;
    }

    public boolean isInputClosed() {
        return this.mInStream.isClosed;
    }

    public InputStream getInputStream() {
        return this.mInStream;
    }

    public OutputStream getOutputStream() {
        return this.mOutStream;
    }

    protected class CircularByteBufferInputStream extends InputStream {
        protected boolean isClosed = false;

        @Override // java.io.InputStream
        public boolean markSupported() {
            return false;
        }

        protected CircularByteBufferInputStream() {
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            synchronized (CircularByteBuffer.this) {
                this.isClosed = true;
                CircularByteBuffer.this.notifyAll();
            }
        }

        @Override // java.io.InputStream
        public int available() throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (CircularByteBuffer.this.mReadPos <= CircularByteBuffer.this.mWritePos) {
                    return CircularByteBuffer.this.mWritePos - CircularByteBuffer.this.mReadPos;
                }
                return (CircularByteBuffer.this.mWritePos + CircularByteBuffer.this.mBuffer.length) - CircularByteBuffer.this.mReadPos;
            }
        }

        private void ensureDataToRead() throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (available() > 0) {
                    return;
                }
                try {
                    CircularByteBuffer.this.wait();
                    if (this.isClosed) {
                        throw new IOException("OutputStream is closed.");
                    }
                } catch (InterruptedException unused) {
                    throw new IOException("Blocked read was interrupted");
                }
            }
        }

        private void advanceReadPos(long j) {
            synchronized (CircularByteBuffer.this) {
                CircularByteBuffer circularByteBuffer = CircularByteBuffer.this;
                circularByteBuffer.mReadPos = (int) (((long) circularByteBuffer.mReadPos) + j);
                if (CircularByteBuffer.this.mReadPos >= CircularByteBuffer.this.mBuffer.length) {
                    CircularByteBuffer.this.mReadPos = 0;
                }
                CircularByteBuffer.this.notifyAll();
            }
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            if (this.isClosed) {
                throw new IOException("InputStream is closed.");
            }
            synchronized (CircularByteBuffer.this) {
                if (available() > 0) {
                    int i = CircularByteBuffer.this.mBuffer[CircularByteBuffer.this.mReadPos] & 255;
                    advanceReadPos(1L);
                    return i;
                }
                if (CircularByteBuffer.this.mOutStream.isClosed) {
                    return -1;
                }
                ensureDataToRead();
                return 0;
            }
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr) throws IOException {
            return read(bArr, 0, bArr.length);
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            if (this.isClosed) {
                throw new IOException("InputStream is closed.");
            }
            synchronized (CircularByteBuffer.this) {
                int i3 = 0;
                int i4 = i2;
                while (i4 > 0) {
                    int iAvailable = available();
                    if (iAvailable == 0) {
                        if (CircularByteBuffer.this.mOutStream.isClosed && i3 == 0) {
                            return -1;
                        }
                        return i3;
                    }
                    ensureDataToRead();
                    if (iAvailable >= i4) {
                        iAvailable = i4;
                    }
                    int length = CircularByteBuffer.this.mBuffer.length - CircularByteBuffer.this.mReadPos;
                    if (iAvailable >= length) {
                        iAvailable = length;
                    }
                    System.arraycopy(CircularByteBuffer.this.mBuffer, CircularByteBuffer.this.mReadPos, bArr, (i + i2) - i4, iAvailable);
                    i4 -= iAvailable;
                    i3 += iAvailable;
                    advanceReadPos(iAvailable);
                }
                return i3;
            }
        }

        @Override // java.io.InputStream
        public long skip(long j) throws IOException {
            long j2;
            if (this.isClosed) {
                throw new IOException("InputStream is closed.");
            }
            synchronized (CircularByteBuffer.this) {
                j2 = j;
                while (j2 > 0) {
                    int iAvailable = available();
                    if (iAvailable == 0) {
                        break;
                    }
                    long j3 = iAvailable;
                    if (j3 >= j2) {
                        j3 = j2;
                    }
                    long length = CircularByteBuffer.this.mBuffer.length - CircularByteBuffer.this.mReadPos;
                    if (j3 >= length) {
                        j3 = length;
                    }
                    j2 -= j3;
                    advanceReadPos(j3);
                }
            }
            if (CircularByteBuffer.this.mOutStream.isClosed) {
                return 0L;
            }
            return j - j2;
        }
    }

    protected class CircularByteBufferOutputStream extends OutputStream {
        protected boolean isClosed = false;

        protected CircularByteBufferOutputStream() {
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (!this.isClosed) {
                    flush();
                    this.isClosed = true;
                    CircularByteBuffer.this.notifyAll();
                }
            }
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (this.isClosed) {
                    throw new IOException("OutputStream is closed.");
                }
                if (CircularByteBuffer.this.mInStream.isClosed) {
                    throw new IOException("InputStream is closed.");
                }
            }
        }

        @Override // java.io.OutputStream
        public void write(int i) throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (this.isClosed) {
                    throw new IOException("OutputStream is closed.");
                }
                if (CircularByteBuffer.this.mInStream.isClosed) {
                    throw new IOException("InputStream is closed.");
                }
                ensureSpaceToWrite();
                CircularByteBuffer.this.mBuffer[CircularByteBuffer.this.mWritePos] = (byte) (i & 255);
                advanceWritePos(1L);
            }
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr) throws IOException {
            write(bArr, 0, bArr.length);
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr, int i, int i2) throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (this.isClosed) {
                    throw new IOException("OutputStream is closed.");
                }
                if (CircularByteBuffer.this.mInStream.isClosed) {
                    throw new IOException("InputStream is closed.");
                }
                int i3 = i2;
                while (i3 > 0) {
                    int iAvailableToWrite = availableToWrite();
                    if (iAvailableToWrite == 0) {
                        ensureSpaceToWrite();
                    }
                    if (iAvailableToWrite >= i3) {
                        iAvailableToWrite = i3;
                    }
                    int length = CircularByteBuffer.this.mBuffer.length - CircularByteBuffer.this.mWritePos;
                    if (iAvailableToWrite >= length) {
                        iAvailableToWrite = length;
                    }
                    System.arraycopy(bArr, (i + i2) - i3, CircularByteBuffer.this.mBuffer, CircularByteBuffer.this.mWritePos, iAvailableToWrite);
                    i3 -= iAvailableToWrite;
                    advanceWritePos(iAvailableToWrite);
                }
            }
        }

        private void advanceWritePos(long j) {
            synchronized (CircularByteBuffer.this) {
                CircularByteBuffer circularByteBuffer = CircularByteBuffer.this;
                circularByteBuffer.mWritePos = (int) (((long) circularByteBuffer.mWritePos) + j);
                if (CircularByteBuffer.this.mWritePos >= CircularByteBuffer.this.mBuffer.length) {
                    CircularByteBuffer.this.mWritePos = 0;
                }
                CircularByteBuffer.this.notifyAll();
            }
        }

        private int availableToWrite() throws IOException {
            if (CircularByteBuffer.this.mWritePos >= CircularByteBuffer.this.mReadPos) {
                return ((CircularByteBuffer.this.mReadPos + CircularByteBuffer.this.mBuffer.length) - 1) - CircularByteBuffer.this.mWritePos;
            }
            return (CircularByteBuffer.this.mReadPos - CircularByteBuffer.this.mWritePos) - 1;
        }

        private void ensureSpaceToWrite() throws IOException {
            synchronized (CircularByteBuffer.this) {
                if (availableToWrite() == 0) {
                    if (CircularByteBuffer.this.mInfinite) {
                        CircularByteBuffer.this.growBuffer();
                    } else {
                        try {
                            CircularByteBuffer.this.wait();
                            if (this.isClosed) {
                                throw new IOException("OutputStream is closed.");
                            }
                        } catch (InterruptedException unused) {
                            throw new IOException("Blocked write was interrupted");
                        }
                    }
                }
            }
        }
    }
}
