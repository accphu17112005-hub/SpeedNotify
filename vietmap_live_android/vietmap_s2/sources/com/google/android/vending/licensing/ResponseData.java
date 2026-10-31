package com.google.android.vending.licensing;

import android.text.TextUtils;
import com.navngo.igo.javaclient.Config;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ResponseData {
    public String extra;
    public int nonce;
    public String packageName;
    public int responseCode;
    public long timestamp;
    public String userId;
    public String versionCode;

    public static ResponseData parse(String str) {
        int iIndexOf = str.indexOf(58);
        String strSubstring = Config.def_additional_assets;
        if (-1 != iIndexOf) {
            String strSubstring2 = str.substring(0, iIndexOf);
            if (iIndexOf < str.length()) {
                strSubstring = str.substring(iIndexOf + 1);
            }
            str = strSubstring2;
        }
        String[] strArrSplit = TextUtils.split(str, Pattern.quote("|"));
        if (strArrSplit.length < 6) {
            throw new IllegalArgumentException("Wrong number of fields.");
        }
        ResponseData responseData = new ResponseData();
        responseData.extra = strSubstring;
        responseData.responseCode = Integer.parseInt(strArrSplit[0]);
        responseData.nonce = Integer.parseInt(strArrSplit[1]);
        responseData.packageName = strArrSplit[2];
        responseData.versionCode = strArrSplit[3];
        responseData.userId = strArrSplit[4];
        responseData.timestamp = Long.parseLong(strArrSplit[5]);
        return responseData;
    }

    public String toString() {
        return TextUtils.join("|", new Object[]{Integer.valueOf(this.responseCode), Integer.valueOf(this.nonce), this.packageName, this.versionCode, this.userId, Long.valueOf(this.timestamp)});
    }
}
