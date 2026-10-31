package com.navngo.igo.javaclient.sdcard;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SDCard {
    private static final String logname = "SDCard";

    public static Kartonok getCids() {
        String str;
        Iterator<Karton> it;
        String str2;
        String strReplaceAll;
        String strReplaceAll2;
        String str3;
        String strTrim;
        String str4 = Config.def_additional_assets;
        String str5 = "0";
        Kartonok kartonok = new Kartonok();
        Pattern patternCompile = Pattern.compile(".*");
        String[] fileList = StreamUtility.getFileList("/sys/block/", patternCompile);
        String[] fileList2 = StreamUtility.getFileList("/sys/dev/block/", patternCompile);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(Arrays.asList(fileList));
        arrayList.addAll(Arrays.asList(fileList2));
        Iterator it2 = arrayList.iterator();
        while (true) {
            str = "cid_major";
            if (!it2.hasNext()) {
                break;
            }
            String str6 = (String) it2.next();
            String str7 = "/sys/block/" + str6 + "/dev";
            String str8 = str5;
            if (!new File(str7).exists()) {
                str7 = "/sys/dev/block/" + str6 + "/dev";
            }
            try {
                strTrim = StreamUtility.readFile(str7).trim();
                strReplaceAll = strTrim.replaceAll(":.*", str4);
            } catch (IOException e) {
                e = e;
                strReplaceAll = str8;
            }
            try {
                strReplaceAll2 = strTrim.replaceAll(".*:", str4);
            } catch (IOException e2) {
                e = e2;
                DebugLogger.D2(logname, "device/major:minor", e);
                strReplaceAll2 = str8;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("/sys/dev/block/");
            sb.append(strReplaceAll);
            String str9 = str4;
            sb.append(":");
            sb.append(strReplaceAll2);
            Iterator it3 = it2;
            sb.append("/device");
            String string = sb.toString();
            Kartonok kartonok2 = kartonok;
            StringBuilder sb2 = new StringBuilder();
            sb2.append(string);
            String str10 = string;
            sb2.append("/cid");
            String string2 = sb2.toString();
            if (!new File(string2).exists()) {
                String str11 = "/sys/block/" + str6 + "/device";
                str10 = str11;
                string2 = str11 + "/cid";
            }
            if (new File(string2).exists()) {
                str3 = str10;
            } else {
                str3 = "/sys/dev/block/" + strReplaceAll + ":" + strReplaceAll2 + "/../device";
                string2 = str3 + "/cid";
            }
            Karton karton = new Karton();
            karton.put("blockdir", str6);
            karton.put("cid_major", strReplaceAll);
            karton.put("cid_minor", strReplaceAll2);
            if (new File(string2).exists()) {
                String str12 = str3 + "/name";
                String str13 = str3 + "/type";
                karton.put("cid_path", string2);
                try {
                    karton.put("cid_name", StreamUtility.readFile(str12).trim());
                } catch (IOException e3) {
                    DebugLogger.D2(logname, "device/name", e3);
                }
                try {
                    karton.put("cid_type", StreamUtility.readFile(str13).trim());
                } catch (IOException e4) {
                    DebugLogger.D2(logname, "device/type", e4);
                }
                try {
                    karton.put("cid_value", StreamUtility.readFile(string2).trim());
                } catch (IOException e5) {
                    DebugLogger.D2(logname, "device/cid", e5);
                }
                karton.put("cid_sdscore", "10");
            }
            kartonok2.add(karton);
            kartonok = kartonok2;
            str5 = str8;
            str4 = str9;
            it2 = it3;
        }
        Kartonok kartonok3 = kartonok;
        Iterator<Karton> it4 = kartonok3.iterator();
        while (it4.hasNext()) {
            Karton next = it4.next();
            if (next.get("cid_value") == null) {
                Karton karton2 = null;
                int i = -1;
                int i2 = Integer.parseInt(next.get("cid_minor"));
                int i3 = Integer.parseInt(next.get(str));
                for (Karton karton3 : kartonok3) {
                    Iterator<Karton> it5 = it4;
                    int i4 = Integer.parseInt(karton3.get("cid_minor"));
                    String str14 = str;
                    if (i3 == Integer.parseInt(karton3.get(str)) && i2 > i4 && karton3.get("cid_value") != null && karton3.get("cid_copied") == null && (karton2 == null || i < i4)) {
                        i = i4;
                        karton2 = karton3;
                    }
                    it4 = it5;
                    str = str14;
                }
                it = it4;
                str2 = str;
                if (karton2 != null) {
                    next.put("cid_value", karton2.get("cid_value"));
                    if (next.get("cid_name") == null) {
                        next.put("cid_name", karton2.get("cid_name"));
                    }
                    if (next.get("cid_type") == null) {
                        next.put("cid_type", karton2.get("cid_type"));
                    }
                    if (next.get("cid_path") == null) {
                        next.put("cid_path", karton2.get("cid_path"));
                    }
                    next.put("cid_copied", "true");
                }
            } else {
                it = it4;
                str2 = str;
            }
            it4 = it;
            str = str2;
        }
        return kartonok3;
    }
}
