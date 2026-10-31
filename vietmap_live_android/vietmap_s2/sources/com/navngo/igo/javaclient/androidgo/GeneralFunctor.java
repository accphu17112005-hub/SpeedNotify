package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class GeneralFunctor {
    private static final String logname = "GeneralFunctor";
    private Method mFunction;
    private String mName;
    private Object mObj;

    public String getName() {
        return this.mName;
    }

    public Class<?>[] getParameterTypes() {
        return this.mFunction.getParameterTypes();
    }

    public GeneralFunctor(String str, Object obj, String str2) {
        Method method;
        this.mFunction = null;
        this.mName = str;
        this.mObj = obj;
        Class<?> superclass = obj.getClass();
        while (true) {
            try {
                method = this.mFunction;
                if (method != null || superclass == null) {
                    break;
                }
                this.mFunction = searchMethod(str2, superclass);
                superclass = superclass.getSuperclass();
            } catch (Exception e) {
                DebugLogger.D1(logname, "Exception while trying to find method:", e);
                return;
            }
        }
        if (method == null) {
            DebugLogger.D1(logname, "Cannot find method: " + str2, null);
        }
    }

    private Method searchMethod(String str, Class<?> cls) {
        for (Method method : cls.getDeclaredMethods()) {
            if (method.getName().equals(str)) {
                return method;
            }
        }
        return null;
    }

    public Object call(Object... objArr) {
        Method method = this.mFunction;
        if (method != null) {
            try {
                return method.invoke(this.mObj, objArr);
            } catch (Exception e) {
                DebugLogger.D2(logname, "Error invoking method: " + this.mFunction.getName());
                for (Object obj : objArr) {
                    DebugLogger.D2(logname, "Args: " + obj);
                }
                DebugLogger.D1(logname, Config.def_additional_assets + this.mFunction, e);
            }
        }
        return null;
    }
}
