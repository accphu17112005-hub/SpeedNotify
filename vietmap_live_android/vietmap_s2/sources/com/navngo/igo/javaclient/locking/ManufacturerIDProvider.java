package com.navngo.igo.javaclient.locking;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ManufacturerIDProvider {
    static ManufacturerIDProvider mInstance;
    private String mID;

    private ManufacturerIDProvider() {
    }

    public static ManufacturerIDProvider getInstace() {
        if (mInstance == null) {
            mInstance = new ManufacturerIDProvider();
        }
        return mInstance;
    }

    public void setID(String str) {
        this.mID = str;
    }

    public String getID() {
        return this.mID;
    }

    public boolean isValid() {
        String str = this.mID;
        return (str == null || str.length() == 0) ? false : true;
    }
}
