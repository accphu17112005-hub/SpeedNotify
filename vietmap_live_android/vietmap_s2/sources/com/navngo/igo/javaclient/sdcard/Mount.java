package com.navngo.igo.javaclient.sdcard;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.utils.StreamUtility;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Mount {
    private static final String logname = "Mount";

    private static String nvl(String str, String str2) {
        return str != null ? str : str2;
    }

    public static Set<String> getCIDs(boolean z) {
        TreeSet treeSet = new TreeSet();
        String string = Config.getString("android", "sd_mount_path", Config.def_additional_assets);
        List listAsList = Arrays.asList(Config.getString("android", "sd_exclude_mounts", Config.def_additional_assets).replaceAll("\\s+", Config.def_additional_assets).split(","));
        try {
            for (Karton karton : getSDList()) {
                String str = karton.get("mount_fstype");
                if (str != null && (str.matches("vfat") || str.matches("ext.") || str.matches("sdfat"))) {
                    String str2 = karton.get("is_sd");
                    String str3 = karton.get("mount_dir");
                    String str4 = karton.get("cid_value");
                    if (str4 != null && !str4.equals(Config.def_additional_assets) && str3 != null && str2 != null) {
                        DebugLogger.D5(logname, "found CID (is_sd=" + str2 + ") on " + str3 + " CID=" + str4);
                        if (string.isEmpty() || str3.equals(string)) {
                            if (!string.isEmpty() || !listAsList.contains(str3)) {
                                String upperCase = str4.toUpperCase(Locale.ROOT);
                                treeSet.add(upperCase);
                                DebugLogger.D5(logname, "Stored CID= " + upperCase);
                                if (!z) {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            return treeSet;
        } catch (IOException e) {
            DebugLogger.D1(logname, "getSDId():", e);
            return null;
        }
    }

    public static Kartonok getSDList() throws IOException {
        Kartonok mounts = getMounts();
        Iterator<Karton> it = mounts.iterator();
        while (it.hasNext()) {
            guessIsSD(it.next());
        }
        Kartonok kartonokMergeMountAndCid = mergeMountAndCid(mounts, SDCard.getCids());
        for (Karton karton : kartonokMergeMountAndCid) {
            int i = Integer.parseInt(nvl(karton.get("mount_sdscore"), "0")) + 0;
            int i2 = Integer.parseInt(nvl(karton.get("cid_sdscore"), "0"));
            int i3 = i + i2;
            karton.put("sdscore", String.format(null, "%020d", Integer.valueOf(i3)));
            if (i2 > 0) {
                karton.put("is_sd", "yes");
            } else if (i3 < 0) {
                karton.put("is_sd", "not");
            } else {
                karton.put("is_sd", "yes");
            }
        }
        kartonokMergeMountAndCid.sort("sdscore");
        kartonokMergeMountAndCid.reverse();
        return kartonokMergeMountAndCid;
    }

    private static boolean isBetterCIDMatch(String str, String str2, String str3) {
        try {
            int i = Integer.parseInt(str);
            int i2 = Integer.parseInt(str3);
            return Integer.parseInt(str2) < i2 && i2 <= i;
        } catch (NumberFormatException unused) {
            DebugLogger.D2(logname, "Invalid minor number among these: mount_minor=" + str + " prev_cid_minor=" + str2 + " cid_minor=" + str3);
            return false;
        }
    }

    private static Kartonok mergeMountAndCid(Kartonok kartonok, Kartonok kartonok2) {
        String str;
        Kartonok kartonok3 = (Kartonok) kartonok.clone();
        Kartonok kartonok4 = (Kartonok) kartonok2.clone();
        for (int i = 1; i <= 3; i++) {
            int size = kartonok.size();
            while (true) {
                int i2 = size - 1;
                if (size > 0) {
                    Karton karton = kartonok.get(i2);
                    String str2 = karton.get("mount_dev");
                    String str3 = "/" + karton.get("mount_major") + ":" + karton.get("mount_minor");
                    Iterator<Karton> it = kartonok4.iterator();
                    while (it.hasNext()) {
                        Karton next = it.next();
                        String str4 = "/" + next.get("cid_major") + ":" + next.get("cid_minor");
                        String str5 = "/public:" + next.get("cid_major") + "," + next.get("cid_minor");
                        StringBuilder sb = new StringBuilder();
                        sb.append("/public:");
                        Iterator<Karton> it2 = it;
                        sb.append(next.get("cid_major"));
                        sb.append(":");
                        sb.append(next.get("cid_minor"));
                        String string = sb.toString();
                        String str6 = "/public:" + next.get("cid_major") + "-" + next.get("cid_minor");
                        if (i == 2) {
                            str = "/" + next.get("blockdir");
                        } else if (i == 3) {
                            str = "/" + next.get("cid_major") + ":";
                        } else {
                            str = str4;
                        }
                        if (str2.endsWith(str) || str2.endsWith(str5) || str2.endsWith(string) || str2.endsWith(str6) || str3.equals(str)) {
                            kartonok3.get(i2).putAll(next);
                            break;
                        }
                        if (i == 3 && str3.contains(str) && next.get("cid_value") != null) {
                            Karton karton2 = kartonok3.get(i2);
                            if (isBetterCIDMatch(karton2.get("mount_minor"), karton2.get("cid_minor"), next.get("cid_minor"))) {
                                karton2.put("cid_name", next.get("cid_name"));
                                karton2.put("cid_type", next.get("cid_type"));
                                karton2.put("cid_value", next.get("cid_value"));
                                karton2.put("cid_path", next.get("cid_path"));
                                karton2.put("cid_minor", next.get("cid_minor"));
                            }
                        }
                        it = it2;
                    }
                    size = i2;
                }
            }
        }
        kartonok3.addAll(kartonok4);
        return kartonok3;
    }

    public static Kartonok getMounts() throws IOException {
        Kartonok kartonok = new Kartonok();
        for (String str : StreamUtility.readFile("/proc/mounts").split("(?s)\\n")) {
            String[] strArrSplit = str.split("\\s+");
            Karton karton = new Karton();
            if (strArrSplit.length < 4) {
                DebugLogger.D2(logname, "getMounts: unrecognised mount entry: " + str);
            } else {
                karton.put("mount_dev", strArrSplit[0]);
                karton.put("mount_dir", strArrSplit[1]);
                karton.put("mount_fstype", strArrSplit[2]);
                karton.put("mount_opt", strArrSplit[3]);
                String[] majMin = getMajMin(strArrSplit[0]);
                karton.put("mount_major", majMin[0]);
                karton.put("mount_minor", majMin[1]);
                kartonok.add(karton);
                DebugLogger.D5(logname, " " + majMin[0] + ":" + majMin[1] + " " + str);
            }
        }
        return kartonok;
    }

    public static boolean guessIsSD(Karton karton) {
        boolean zMatches;
        boolean zMatches2;
        int i;
        String str = karton.get("mount_dir");
        if (str != null) {
            zMatches2 = str.matches(".*/(sd|xtern).*");
            zMatches = str.matches("(.*ntern.*)|/cache|/data|/system|.*usb.*");
        } else {
            zMatches = true;
            zMatches2 = false;
        }
        String str2 = karton.get("mount_dev");
        boolean zMatches3 = str2 != null ? str2.matches("/dev/.*") : false;
        String str3 = karton.get("mount_fstype");
        boolean zMatches4 = str3 != null ? str3.matches("(root|tmp|dev|proc|sys|cgroup).*") : true;
        if (zMatches2) {
            i = Config.getBool("android", "lock_to_external_sd", false) ? 11 : 1;
        } else {
            i = 0;
        }
        if (zMatches) {
            i -= 10;
        }
        if (zMatches3) {
            i++;
        }
        if (zMatches4) {
            i -= 10;
        }
        karton.put("mount_sdscore", Integer.toString(i));
        return i > 0;
    }

    protected static String[] getMajMin(String str) {
        String[] strArr = {"n/a", "n/a"};
        NNG.MajMinNumbers majMinNumbersGetBlockDeviceMajMin = NNG.GetBlockDeviceMajMin(str);
        if (majMinNumbersGetBlockDeviceMajMin.valid) {
            strArr[0] = Integer.toString(majMinNumbersGetBlockDeviceMajMin.major);
            strArr[1] = Integer.toString(majMinNumbersGetBlockDeviceMajMin.minor);
        }
        return strArr;
    }
}
