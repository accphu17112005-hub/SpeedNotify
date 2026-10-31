package com.navngo.igo.javaclient;

import android.provider.Settings;
import android.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Encryptor {
    public static String encrypt(String str) {
        try {
            String strCorregateString = corregateString(Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id"));
            IvParameterSpec ivParameterSpec = new IvParameterSpec(Config.packageName.substring(0, 16).getBytes("UTF-8"));
            SecretKeySpec secretKeySpec = new SecretKeySpec(strCorregateString.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(1, secretKeySpec, ivParameterSpec);
            return Base64.encodeToString(cipher.doFinal(str.getBytes()), 0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String decrypt(String str) {
        try {
            String strCorregateString = corregateString(Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id"));
            IvParameterSpec ivParameterSpec = new IvParameterSpec(Config.packageName.substring(0, 16).getBytes("UTF-8"));
            SecretKeySpec secretKeySpec = new SecretKeySpec(strCorregateString.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(2, secretKeySpec, ivParameterSpec);
            return new String(cipher.doFinal(Base64.decode(str, 0)));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static String corregateString(String str) {
        if (str.length() < 16) {
            return String.format("%1$16s", str);
        }
        return str.length() > 16 ? str.substring(0, 16) : str;
    }
}
