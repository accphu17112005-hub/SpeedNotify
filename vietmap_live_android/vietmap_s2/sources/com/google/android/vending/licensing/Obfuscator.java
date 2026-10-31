package com.google.android.vending.licensing;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface Obfuscator {
    String obfuscate(String str, String str2);

    String unobfuscate(String str, String str2) throws ValidationException;
}
