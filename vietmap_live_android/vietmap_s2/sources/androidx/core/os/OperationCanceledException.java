package androidx.core.os;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class OperationCanceledException extends RuntimeException {
    public OperationCanceledException() {
        this(null);
    }

    public OperationCanceledException(String str) {
        super(str == null ? "The operation has been canceled." : str);
    }
}
