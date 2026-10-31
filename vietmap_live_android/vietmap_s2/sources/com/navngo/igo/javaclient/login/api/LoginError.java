package com.navngo.igo.javaclient.login.api;

import com.navngo.igo.javaclient.refprod.R;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum LoginError {
    INVALID_OTP("003", "OTP is not valid", R.string.vm_verifierNumberInvalid),
    EXPIRED_OTP("004", "OTP is expired", R.string.vm_verifierNumberExpired),
    TOO_MANY_OTP_REQUESTS("005", "You have request OTP too many times", R.string.vm_verifierPhoneNumberTooManyTimes),
    INVALID_USER("009", "User does not exist", R.string.vm_invalidUser),
    INVALID_PHONE("015", "Phone Number is not valid", R.string.vm_invalidPhoneNumber),
    TOO_MANY_WRONG_TRIES("017", "You have entered the wrong OTP too many times", R.string.vm_verifierWrongNumberTooManyTimes),
    NO_INTERNET("No internet or 4G", "There’s no internet connection", R.string.vm_noInternet),
    NEW_IGO_VERSION_AVAILABLE("021", "Please use the latest version.", R.string.vm_newIGOVersionAvailable),
    ACCOUNTS_BLOCKED("022", "Your accounts has been blocked.", R.string.vm_newIGOVersionAvailable),
    OTHER("Other error", "There’s an error", R.string.vm_otherError);

    private static final Map<String, LoginError> BY_TAG = new HashMap();
    public final String description;
    public final int stringRes;
    public final String tag;

    static {
        for (LoginError loginError : values()) {
            BY_TAG.put(loginError.tag, loginError);
        }
    }

    LoginError(String str, String str2, int i) {
        this.tag = str;
        this.description = str2;
        this.stringRes = i;
    }

    public static LoginError fromTag(String str) {
        Map<String, LoginError> map = BY_TAG;
        return map.containsKey(str) ? map.get(str) : OTHER;
    }
}
