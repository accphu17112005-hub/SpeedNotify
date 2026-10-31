package com.navngo.igo.javaclient;

import android.util.Log;
import android.util.SparseArray;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.program.ProgramPhases;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class DebugLogger {
    private static boolean preEngigeLogging = true;

    public static void D1(String str, String str2, Throwable th) {
        D(DebugLevel.D1, str, str2, th);
    }

    public static void D2(String str, String str2) {
        D(DebugLevel.D2, str, str2, null);
    }

    public static void D2(String str, String str2, Throwable th) {
        D(DebugLevel.D2, str, str2, th);
    }

    public static void D3(String str, String str2) {
        D(DebugLevel.D3, str, str2, null);
    }

    public static void D4(String str, String str2) {
        D(DebugLevel.D4, str, str2, null);
    }

    public static void D5(String str, String str2) {
        D(DebugLevel.D5, str, str2, null);
    }

    public static void DebugLoggerMsg(int i, String str, String str2) {
        String str3 = new SimpleDateFormat("{HH:mm:ss.SSS} ", Locale.getDefault()).format(new Date());
        AndroidGo.getInstance().callIgo("other.android_utils.debug_logger_msg", null, Integer.valueOf(i), str, str3 + str2);
    }

    /* JADX WARN: Enum visitor error
    jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'D1' uses external variables
    	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
    	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
    	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
    	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
    	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
    	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
     */
    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    private static abstract class DebugLevel {
        private static final /* synthetic */ DebugLevel[] $VALUES;
        public static final DebugLevel D1;
        public static final DebugLevel D2;
        public static final DebugLevel D3;
        public static final DebugLevel D4;
        public static final DebugLevel D5;
        public static final DebugLevel DISABLED;
        private final DebugLevel fallback;
        private final int logcatLevel;

        abstract void writeLogcat(String str, Throwable th);

        public static DebugLevel valueOf(String str) {
            return (DebugLevel) Enum.valueOf(DebugLevel.class, str);
        }

        public static DebugLevel[] values() {
            return (DebugLevel[]) $VALUES.clone();
        }

        static {
            DebugLevel debugLevel = new DebugLevel("DISABLED", 0, 'D') { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.1
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                }
            };
            DISABLED = debugLevel;
            int i = 1;
            DebugLevel debugLevel2 = new DebugLevel("D1", i, 'E', i) { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.2
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                    Log.e(Config.logcat_tag, str, th);
                }
            };
            D1 = debugLevel2;
            DebugLevel debugLevel3 = new DebugLevel("D2", 2, 'E', 2, debugLevel2) { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.3
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                    Log.e(Config.logcat_tag, str, th);
                }
            };
            D2 = debugLevel3;
            DebugLevel debugLevel4 = new DebugLevel("D3", 3, 'W', 3, debugLevel3) { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.4
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                    Log.w(Config.logcat_tag, str, th);
                }
            };
            D3 = debugLevel4;
            DebugLevel debugLevel5 = new DebugLevel("D4", 4, 'I', 4, debugLevel4) { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.5
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                    Log.i(Config.logcat_tag, str, th);
                }
            };
            D4 = debugLevel5;
            DebugLevel debugLevel6 = new DebugLevel("D5", 5, 'D', 5, debugLevel5) { // from class: com.navngo.igo.javaclient.DebugLogger.DebugLevel.6
                @Override // com.navngo.igo.javaclient.DebugLogger.DebugLevel
                void writeLogcat(String str, Throwable th) {
                    Log.d(Config.logcat_tag, str, th);
                }
            };
            D5 = debugLevel6;
            $VALUES = new DebugLevel[]{debugLevel, debugLevel2, debugLevel3, debugLevel4, debugLevel5, debugLevel6};
        }

        private static class StaticHolder {
            static SparseArray<DebugLevel> levelMapping = new SparseArray<>();

            private StaticHolder() {
            }
        }

        private DebugLevel(String str, int i, char c) {
            this(str, i, c, 0);
        }

        private DebugLevel(String str, int i, char c, int i2) {
            this(str, i, c, i2, (DebugLevel) null);
        }

        private DebugLevel(String str, int i, char c, int i2, DebugLevel debugLevel) {
            this.logcatLevel = i2;
            this.fallback = debugLevel;
            StaticHolder.levelMapping.put(i2, this);
        }

        void writeUsingLevels(String str, String str2, Throwable th) {
            DebugLevel debugLevel;
            if (Config.logcat_level < this.logcatLevel) {
                return;
            }
            DebugLevel debugLevel2 = this;
            while (Config.logcat_oslevel < debugLevel2.logcatLevel && (debugLevel = debugLevel2.fallback) != null) {
                debugLevel2 = debugLevel;
            }
            debugLevel2.write(str, str2, th);
        }

        void write(String str, String str2, Throwable th) {
            if (DebugLogger.preEngigeLogging) {
                writeLogcat(decorateMessage(str, str2), th);
                return;
            }
            if (th != null) {
                StringWriter stringWriter = new StringWriter();
                th.printStackTrace(new PrintWriter(stringWriter));
                str2 = str2 + "\n" + stringWriter.toString();
            }
            NNG.log(this.logcatLevel, str, str2);
        }

        static String decorateMessage(String str, String str2) {
            int length = str.length();
            StringBuilder sb = new StringBuilder(str2.length() + length + 10);
            if (Config.logcat_thread) {
                sb.append("(th=");
                sb.append(NNGThread.getCurrentThreadId());
                sb.append(") ");
            }
            if (length > 0) {
                sb.append(str);
                sb.append(':');
            }
            sb.append(str2);
            return sb.toString();
        }
    }

    private static void D(DebugLevel debugLevel, String str, String str2, Throwable th) {
        if (debugLevel != DebugLevel.DISABLED) {
            debugLevel.writeUsingLevels(str, str2, th);
        }
    }

    public static void init() {
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.STARTUP, false, new Runnable() { // from class: com.navngo.igo.javaclient.DebugLogger.1
            @Override // java.lang.Runnable
            public void run() {
                Log.d("navngo", "Java DebugLogger preEngigeLogging done, switching to engine debuglogger");
                boolean unused = DebugLogger.preEngigeLogging = false;
            }
        });
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.NO_MORE_INPUT, false, new Runnable() { // from class: com.navngo.igo.javaclient.DebugLogger.2
            @Override // java.lang.Runnable
            public void run() {
                Log.d("navngo", "Engine stopped, switching back to preEngineLogging");
                boolean unused = DebugLogger.preEngigeLogging = true;
            }
        });
    }
}
