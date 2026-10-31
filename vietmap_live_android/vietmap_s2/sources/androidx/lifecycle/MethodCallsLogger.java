package androidx.lifecycle;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class MethodCallsLogger {
    private Map<String, Integer> mCalledMethods = new HashMap();

    public boolean approveCall(String str, int i) {
        Integer num = this.mCalledMethods.get(str);
        int iIntValue = num != null ? num.intValue() : 0;
        boolean z = (iIntValue & i) != 0;
        this.mCalledMethods.put(str, Integer.valueOf(i | iIntValue));
        return !z;
    }
}
