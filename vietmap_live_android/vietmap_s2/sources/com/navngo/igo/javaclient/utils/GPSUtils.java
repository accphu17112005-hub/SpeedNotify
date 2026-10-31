package com.navngo.igo.javaclient.utils;

import androidx.exifinterface.media.ExifInterface;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import java.io.IOException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GPSUtils {
    private static final String logname = "GPSUtils";

    private static GCoor googleAddressDecoder(String str) throws IOException {
        return null;
    }

    public static String normalizeGPSCoords(String str) {
        String[] strArrSplit = str.split(" x ");
        if (strArrSplit.length != 2) {
            return str;
        }
        String[] strArrSplit2 = strArrSplit[0].split(" ");
        if (strArrSplit2.length != 2) {
            return str;
        }
        try {
            strArrSplit2[0] = strArrSplit2[0].substring(1);
            strArrSplit2[1] = strArrSplit2[1].substring(0, strArrSplit2[1].length() - 1);
            double d = Double.parseDouble(strArrSplit2[1]);
            if (strArrSplit2[0].equalsIgnoreCase(ExifInterface.LATITUDE_SOUTH)) {
                d = -d;
            }
            String[] strArrSplit3 = strArrSplit[1].split(" ");
            if (strArrSplit3.length != 2) {
                return str;
            }
            try {
                strArrSplit3[1] = strArrSplit3[1].substring(0, strArrSplit3[1].length() - 2);
                double d2 = Double.parseDouble(strArrSplit3[1]);
                if (strArrSplit3[0].equalsIgnoreCase(ExifInterface.LONGITUDE_WEST)) {
                    d2 = -d2;
                }
                return d + "," + d2;
            } catch (NumberFormatException unused) {
                DebugLogger.D4(logname, strArrSplit3[1] + " represents no double value");
                return str;
            }
        } catch (NumberFormatException unused2) {
            DebugLogger.D4(logname, strArrSplit2[1] + " represents no double value");
            return str;
        }
    }

    public static String normalizeGPSFormatted(String str, int i) {
        if (i == 1) {
            return normalizeGPSCoords(str);
        }
        return "GPS[" + normalizeGPSCoords(str) + "]";
    }

    public static String encodeGPSCoord(GCoor gCoor) {
        return "GPS[" + gCoor.latitude + "," + gCoor.longitude + "]";
    }

    public static GCoor decodeGPSCoord(String str) {
        String gps = parseGPS(str);
        GCoor gCoor = new GCoor();
        if (gps != null) {
            String[] strArrSplit = gps.split(",");
            if (strArrSplit.length == 2) {
                gCoor.latitude = Double.parseDouble(strArrSplit[0]);
                gCoor.longitude = Double.parseDouble(strArrSplit[1]);
            }
        }
        return gCoor;
    }

    public static String parseGPS(String str) {
        int iIndexOf = str.indexOf("GPS[");
        if (iIndexOf == -1) {
            return null;
        }
        String strSubstring = str.substring(iIndexOf + 4);
        int iIndexOf2 = strSubstring.indexOf(93);
        return iIndexOf2 != -1 ? strSubstring.substring(0, iIndexOf2) : strSubstring;
    }

    public static GCoor parseGCoorFromString(String str) {
        Matcher matcher = Pattern.compile(".*\\[.*?([NnSsWwEe]).*?(-?\\d+(?:\\.\\d+)?).*?([NnSsWwEe]).*?(-?\\d+(?:\\.\\d+)?).*?]").matcher(str);
        DebugLogger.D4("parseGCoor:", String.format("MatchingA: '%s'", str));
        if (matcher.find()) {
            String strGroup = matcher.group(1);
            char cCharAt = (strGroup != null ? strGroup.toUpperCase(Locale.US) : " ").charAt(0);
            String strGroup2 = matcher.group(2);
            char cCharAt2 = (matcher.group(3).toUpperCase(Locale.US) + " ").charAt(0);
            String strGroup3 = matcher.group(4);
            GCoor gCoor = new GCoor();
            if (cCharAt == 'N' || cCharAt == 'S') {
                gCoor.latitude = Double.parseDouble(strGroup2);
                gCoor.longitude = Double.parseDouble(strGroup3);
                if (cCharAt == 'S' && gCoor.latitude > 0.0d) {
                    gCoor.latitude = -gCoor.latitude;
                }
                if (cCharAt2 == 'W' && gCoor.longitude > 0.0d) {
                    gCoor.longitude = -gCoor.longitude;
                }
            } else if (cCharAt == 'W' || cCharAt == 'E') {
                gCoor.longitude = Double.parseDouble(strGroup2);
                gCoor.latitude = Double.parseDouble(strGroup3);
                if (cCharAt2 == 'S' && gCoor.latitude > 0.0d) {
                    gCoor.latitude = -gCoor.latitude;
                }
                if (cCharAt == 'W' && gCoor.longitude > 0.0d) {
                    gCoor.longitude = -gCoor.longitude;
                }
            }
            DebugLogger.D4("parseGCoor:", String.format(null, "Match found A: '%c' '%c' '%f' '%f'", Character.valueOf(cCharAt), Character.valueOf(cCharAt2), Double.valueOf(gCoor.latitude), Double.valueOf(gCoor.longitude)));
            return gCoor;
        }
        Matcher matcher2 = Pattern.compile(".*\\[.*?(-?\\d+(?:\\.\\d+)?).*?(-?\\d+(?:\\.\\d+)?).*?]").matcher(str);
        DebugLogger.D4("parseGCoor:", String.format("MatchingB: '%s'", str));
        if (!matcher2.find()) {
            return null;
        }
        GCoor gCoor2 = new GCoor();
        gCoor2.latitude = Double.parseDouble(matcher2.group(1));
        gCoor2.longitude = Double.parseDouble(matcher2.group(2));
        DebugLogger.D4("parseGCoor:", String.format(null, "Match found B: '%f' '%f' ", Double.valueOf(gCoor2.latitude), Double.valueOf(gCoor2.longitude)));
        return gCoor2;
    }

    public static GCoor parseGoogleCoordsFromString(String str) {
        Matcher matcher = Pattern.compile("([-+\\d\\. ]+)([NnSs]?) *, *([-+\\d\\. ]+)([EeWw]?)").matcher(str);
        if (matcher.find()) {
            Double degree = parseDegree(matcher.group(1));
            Double degree2 = parseDegree(matcher.group(3));
            if (!degree.isNaN() && !degree2.isNaN()) {
                if (degree.doubleValue() > 0.0d && matcher.group(2).toUpperCase(Locale.US).equals(ExifInterface.LATITUDE_SOUTH)) {
                    degree = Double.valueOf(-degree.doubleValue());
                }
                if (degree2.doubleValue() > 0.0d && matcher.group(4).toUpperCase(Locale.US).equals(ExifInterface.LONGITUDE_WEST)) {
                    degree2 = Double.valueOf(-degree2.doubleValue());
                }
                GCoor gCoor = new GCoor();
                gCoor.latitude = degree.doubleValue();
                gCoor.longitude = degree2.doubleValue();
                return gCoor;
            }
        }
        return null;
    }

    public static Double parseDegree(String str) {
        Double dValueOf = Double.valueOf(Double.NaN);
        double d = 0.0d;
        if (dValueOf.isNaN()) {
            Matcher matcher = Pattern.compile("^[^-\\d.]*(-?) *([\\d]+) +([\\d]+) +(\\d*\\.\\d*) *$").matcher(str);
            if (matcher.find()) {
                try {
                    dValueOf = Double.valueOf(Double.valueOf(Double.parseDouble(matcher.group(2))).doubleValue() + (Double.valueOf(Double.parseDouble(matcher.group(3))).doubleValue() / 60.0d) + (Double.valueOf(matcher.group(4).equals(".") ? 0.0d : Double.parseDouble(matcher.group(4))).doubleValue() / 3600.0d));
                    if (matcher.group(1).equals("-")) {
                        dValueOf = Double.valueOf(-dValueOf.doubleValue());
                    }
                } catch (NumberFormatException unused) {
                }
            }
        }
        if (dValueOf.isNaN()) {
            Matcher matcher2 = Pattern.compile("^[^-\\d.]*(-?) *([\\d]+) +(\\d*\\.\\d*) *$").matcher(str);
            if (matcher2.find()) {
                try {
                    Double dValueOf2 = Double.valueOf(Double.parseDouble(matcher2.group(2)));
                    if (!matcher2.group(3).equals(".")) {
                        d = Double.parseDouble(matcher2.group(3));
                    }
                    dValueOf = Double.valueOf(dValueOf2.doubleValue() + (Double.valueOf(d).doubleValue() / 60.0d));
                    if (matcher2.group(1).equals("-")) {
                        dValueOf = Double.valueOf(-dValueOf.doubleValue());
                    }
                } catch (NumberFormatException unused2) {
                }
            }
        }
        if (!dValueOf.isNaN()) {
            return dValueOf;
        }
        Matcher matcher3 = Pattern.compile(" *(-?) *([\\d]*)\\.([\\d]*) *$").matcher(str);
        if (!matcher3.find()) {
            return dValueOf;
        }
        try {
            String str2 = matcher3.group(1).equals("-") ? "-" : Config.def_additional_assets;
            if (!matcher3.group(2).equals(Config.def_additional_assets)) {
                str2 = str2 + matcher3.group(2);
            }
            String str3 = str2 + ".";
            if (!matcher3.group(3).equals(Config.def_additional_assets)) {
                str3 = str3 + matcher3.group(3);
            }
            return Double.valueOf(Double.parseDouble(str3));
        } catch (NumberFormatException unused3) {
            return dValueOf;
        }
    }

    public static boolean isRelevantCoord(String str) {
        return str.length() > 0 && !str.equals(" x ");
    }

    public static GCoor getPositionFromAddress(String str) {
        GCoor gCoorGoogleAddressDecoder;
        try {
            gCoorGoogleAddressDecoder = googleAddressDecoder(str);
            if (gCoorGoogleAddressDecoder == null) {
                try {
                    int iIndexOf = str.indexOf("GPS[");
                    if (iIndexOf != -1) {
                        gCoorGoogleAddressDecoder = googleAddressDecoder(str.substring(0, iIndexOf));
                    }
                } catch (IOException e) {
                    e = e;
                    DebugLogger.D2("iGO", e.getMessage(), e);
                }
            }
        } catch (IOException e2) {
            e = e2;
            gCoorGoogleAddressDecoder = null;
        }
        return gCoorGoogleAddressDecoder == null ? parseGCoorFromString(str) : gCoorGoogleAddressDecoder;
    }
}
