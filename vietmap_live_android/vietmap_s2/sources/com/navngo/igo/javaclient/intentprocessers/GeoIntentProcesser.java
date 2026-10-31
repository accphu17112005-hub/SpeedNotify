package com.navngo.igo.javaclient.intentprocessers;

import android.content.Intent;
import android.net.Uri;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.utils.GPSUtils;
import com.navngo.program.ProgramPhases;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GeoIntentProcesser implements IIntentProcesser {
    private static final String logname = "GeoIntentProcesser";

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return "geo".equals(intent.getScheme()) || matchesGoogleMapsFilter1(intent.getData()) || matchesGoogleMapsFilter2(intent.getData());
    }

    private boolean matchesGoogleMapsFilter1(Uri uri) {
        return uri != null && "https".equals(uri.getScheme()) && "maps.google.com".equals(uri.getHost());
    }

    private boolean matchesGoogleMapsFilter2(Uri uri) {
        return uri != null && "https".equals(uri.getScheme()) && "www.google.com".equals(uri.getHost()) && uri.getPath() != null && uri.getPath().startsWith("/map");
    }

    private String getQueryParam(Uri uri, String str) {
        if (uri.isHierarchical()) {
            return uri.getQueryParameter(str);
        }
        String query = uri.getQuery();
        if (query == null) {
            return null;
        }
        for (String str2 : query.split("&")) {
            String[] strArrSplit = str2.split("=", 2);
            if (strArrSplit[0].equals(str)) {
                return strArrSplit[1];
            }
        }
        return null;
    }

    private boolean processGeoScheme(Uri uri) {
        if (!"geo".equals(uri.getScheme())) {
            return false;
        }
        String schemeSpecificPart = uri.getSchemeSpecificPart();
        if (schemeSpecificPart.indexOf(63) >= 0) {
            schemeSpecificPart = schemeSpecificPart.substring(0, schemeSpecificPart.indexOf(63));
        }
        DebugLogger.D2(logname, "Geo intent Specific part:" + schemeSpecificPart);
        String[] strArrSplit = schemeSpecificPart.split(",");
        if (strArrSplit.length == 2) {
            GCoor gCoorCreateFromString = GCoor.createFromString(strArrSplit[0], strArrSplit[1]);
            if (gCoorCreateFromString.isValid() && !gCoorCreateFromString.isZero()) {
                AddressResolver.getResolver().calculateRouteToPosition(gCoorCreateFromString, true);
                return true;
            }
            final String queryParam = getQueryParam(uri, "q");
            if (queryParam != null && !queryParam.isEmpty()) {
                DebugLogger.D3(logname, "q='" + queryParam + "'");
                if (ProgramPhases.getInstance().getPhase().getCode() < ProgramPhases.Phase.RUNNING.getCode()) {
                    ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.RUNNING, false, new Runnable() { // from class: com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser.1
                        @Override // java.lang.Runnable
                        public void run() {
                            AddressResolver.getResolver().jumpToAddressSelective(null, queryParam);
                        }
                    });
                } else {
                    AddressResolver.getResolver().jumpToAddressSelective(null, queryParam);
                }
                return true;
            }
        }
        return false;
    }

    private boolean processGoogleMapsScheme(Uri uri) {
        if (!matchesGoogleMapsFilter1(uri) && !matchesGoogleMapsFilter2(uri)) {
            return false;
        }
        String schemeSpecificPart = uri.getSchemeSpecificPart();
        DebugLogger.D2(logname, "Geo intent GoogleMapsScheme Specific Part:" + schemeSpecificPart);
        String[] strArr = {"\\&sll\\=", "\\@", "\\&q\\=", "\\&p\\=", Config.def_additional_assets};
        for (int i = 0; i < 5; i++) {
            try {
                Matcher matcher = Pattern.compile(strArr[i] + "((\\+|\\-)?\\d+\\.\\d+),((\\+|\\-)?\\d+\\.\\d+)").matcher(schemeSpecificPart);
                if (matcher.find()) {
                    String strGroup = matcher.group(1);
                    String strGroup2 = matcher.group(3);
                    DebugLogger.D2(logname, "Geo intent GoogleMapsHost lat,lon: " + strGroup + "," + strGroup2);
                    GCoor gCoorCreateFromString = GCoor.createFromString(strGroup, strGroup2);
                    if (gCoorCreateFromString.isValid()) {
                        AddressResolver.getResolver().calculateRouteToPosition(gCoorCreateFromString, true);
                        return true;
                    }
                }
            } catch (PatternSyntaxException unused) {
            }
        }
        return false;
    }

    private boolean processIntentImp(Intent intent) {
        Uri data;
        if (!matchesIntent(intent) || (data = intent.getData()) == null) {
            return false;
        }
        if (!processGeoScheme(data) && !processGoogleMapsScheme(data)) {
            String path = data.getPath();
            DebugLogger.D2(logname, "path: " + path);
            if (path == null) {
                return false;
            }
            GCoor gCoorFromString = GPSUtils.parseGCoorFromString(path);
            if (gCoorFromString != null) {
                AddressResolver.getResolver().calculateRouteToPosition(gCoorFromString, true);
            } else {
                AddressResolver.getResolver().jumpToAddressSelective(null, path);
            }
        }
        return true;
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        boolean zProcessIntentImp = processIntentImp(intent);
        if (!zProcessIntentImp) {
            DebugLogger.D2(logname, "Geo intent cant find the coords");
            AddressResolver.getResolver().showErrorMessage();
        }
        return zProcessIntentImp;
    }
}
