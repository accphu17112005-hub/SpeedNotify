package com.navngo.igo.javaclient.address;

import com.navngo.igo.javaclient.Config;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class StructuredAddress {
    public final String city;
    public final String country;
    public final String state;
    public final String street;
    public final String zip;

    public StructuredAddress() {
        this.country = Config.def_additional_assets;
        this.state = Config.def_additional_assets;
        this.city = Config.def_additional_assets;
        this.street = Config.def_additional_assets;
        this.zip = Config.def_additional_assets;
    }

    public StructuredAddress(String str, String str2, String str3, String str4, String str5) {
        this.country = str == null ? Config.def_additional_assets : str;
        this.state = str2 == null ? Config.def_additional_assets : str2;
        this.city = str3 == null ? Config.def_additional_assets : str3;
        this.street = str4 == null ? Config.def_additional_assets : str4;
        this.zip = str5 == null ? Config.def_additional_assets : str5;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        appendField(sb, this.country, true);
        appendField(sb, this.state, true);
        if (this.city.length() == 0 || !Config.getBool("freetext_search", "no_zip_if_city_available", Config.def_no_zip_if_city_available)) {
            appendField(sb, this.zip, true);
        }
        appendField(sb, this.city, true);
        appendField(sb, this.street, false);
        return sb.toString();
    }

    private void appendField(StringBuilder sb, String str, boolean z) {
        if (str.length() > 0) {
            sb.append(str);
            if (z) {
                sb.append(", ");
            }
        }
    }
}
