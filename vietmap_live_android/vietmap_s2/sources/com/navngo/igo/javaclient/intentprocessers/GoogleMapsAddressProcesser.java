package com.navngo.igo.javaclient.intentprocessers;

import android.content.Intent;
import android.net.Uri;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.utils.GPSUtils;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GoogleMapsAddressProcesser implements IIntentProcesser {
    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return ("http".equals(intent.getScheme()) || "https".equals(intent.getScheme())) && intent.getData() != null && "maps.google.com".equals(intent.getData().getHost());
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        if (matchesIntent(intent)) {
            Uri data = intent.getData();
            String queryParameter = data.getQueryParameter("q");
            if (queryParameter == null) {
                queryParameter = data.getQueryParameter("near");
            }
            if (queryParameter == null) {
                queryParameter = data.getQueryParameter("ll");
            }
            GCoor positionFromGoogleQuery = getPositionFromGoogleQuery(queryParameter);
            if (positionFromGoogleQuery == null) {
                String queryParameter2 = data.getQueryParameter("daddr");
                if (queryParameter2 == null) {
                    queryParameter2 = data.getQueryParameter("saddr");
                }
                if (queryParameter2 == null) {
                    queryParameter2 = data.getQueryParameter("mrad");
                }
                if (queryParameter2 == null) {
                    queryParameter2 = data.getQueryParameter("q");
                }
                if (queryParameter2 != null) {
                    String strReplace = queryParameter2.replace('+', ' ');
                    GCoor positionFromAddress = GPSUtils.getPositionFromAddress(strReplace);
                    if (positionFromAddress == null) {
                        AddressResolver.getResolver().jumpToAddressSelective(null, strReplace);
                        return true;
                    }
                    AddressResolver.getResolver().jumpToPosition(positionFromAddress);
                    return true;
                }
            } else {
                AddressResolver.getResolver().jumpToPosition(positionFromGoogleQuery);
                return true;
            }
        }
        return false;
    }

    private GCoor getPositionFromGoogleQuery(String str) {
        if (str != null) {
            Pattern patternCompile = Pattern.compile("[(][^()]*[)]");
            Matcher matcher = patternCompile.matcher(str);
            while (matcher.find()) {
                str = matcher.replaceAll(Config.def_additional_assets);
                matcher = patternCompile.matcher(str);
            }
        }
        if (str != null) {
            return GPSUtils.parseGoogleCoordsFromString(str);
        }
        return null;
    }
}
