package com.navngo.igo.javaclient;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LayeredConfig {
    public static final int PRIO_DEVICE_CONFIG = 1090;
    public static final int PRIO_SYSTXT = 10;
    private static final String logname = "LayeredConfig";
    private Map<String, Map<String, Value>> mGroups = new HashMap();

    private enum VAL_TYPE {
        STRING,
        INT,
        FLOAT
    }

    private class Value {
        public double dVle;
        public long lVle;
        public int prio;
        public String sVle;
        public VAL_TYPE type;

        public Value(int i, String str) {
            this.prio = i;
            this.sVle = str;
            this.type = VAL_TYPE.STRING;
            try {
                try {
                    this.lVle = Long.parseLong(this.sVle);
                    this.type = VAL_TYPE.INT;
                } catch (NumberFormatException unused) {
                }
            } catch (NumberFormatException unused2) {
                this.dVle = Double.parseDouble(this.sVle);
                this.type = VAL_TYPE.FLOAT;
            }
        }
    }

    public synchronized void add(int i, String str, String str2, String str3, String str4) {
        Map<String, Value> map = this.mGroups.get(str);
        if (map == null) {
            map = new HashMap<>();
            this.mGroups.put(str, map);
        }
        Value value = map.get(str2);
        if (value == null || value.prio >= i) {
            map.put(str2, new Value(i, str3));
        }
        if (!Config.silent_startup) {
            DebugLogger.D3(logname, str4 + ": group = (" + str + ") key = (" + str2 + ") value = (" + str3 + ")");
        }
    }

    private Value getValue(String str, String str2) {
        Map<String, Value> map = this.mGroups.get(str);
        if (map == null) {
            return null;
        }
        return map.get(str2);
    }

    public String getString(String str, String str2, String str3) {
        Value value = getValue(str, str2);
        return value == null ? str3 : value.sVle;
    }

    public boolean getBool(String str, String str2, boolean z) {
        Value value = getValue(str, str2);
        return (value == null || value.type != VAL_TYPE.INT) ? z : value.lVle != 0;
    }

    public int getInt(String str, String str2, int i) {
        Value value = getValue(str, str2);
        return (value == null || value.type != VAL_TYPE.INT) ? i : (int) value.lVle;
    }

    public long getLong(String str, String str2, long j) {
        Value value = getValue(str, str2);
        return (value == null || value.type != VAL_TYPE.INT) ? j : value.lVle;
    }

    public double getDouble(String str, String str2, double d) {
        Value value = getValue(str, str2);
        return (value == null || value.type == VAL_TYPE.STRING) ? d : value.type == VAL_TYPE.INT ? value.lVle : value.dVle;
    }
}
