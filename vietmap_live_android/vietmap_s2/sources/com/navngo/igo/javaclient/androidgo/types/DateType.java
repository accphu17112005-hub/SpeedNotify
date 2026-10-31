package com.navngo.igo.javaclient.androidgo.types;

import java.nio.ByteOrder;
import java.util.Calendar;
import java.util.GregorianCalendar;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class DateType {
    private Calendar mCalendar = null;
    private byte mDay;
    private byte mMonth;
    private int mYear;

    public static DateType createFromCurrentDate() {
        GregorianCalendar gregorianCalendar = new GregorianCalendar();
        return new DateType(gregorianCalendar.get(1), gregorianCalendar.get(2), gregorianCalendar.get(5));
    }

    public static DateType createFromIgoInt(int i) {
        int i2;
        int i3;
        if (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN) {
            i2 = i >>> 16;
            i3 = (i >>> 8) & 255;
        } else {
            i2 = 65535 & i;
            i3 = (i >>> 16) & 255;
            i >>>= 24;
        }
        return new DateType(i2, i3, i & 255);
    }

    public DateType(int i, int i2, int i3) {
        setDate(i, i2, i3);
    }

    public DateType(DateType dateType) {
        setDate(dateType);
    }

    public void add(int i, int i2, int i3) {
        Calendar calendar = getCalendar();
        calendar.add(1, i);
        calendar.add(2, i2);
        calendar.add(5, i3);
        this.mYear = calendar.get(1);
        this.mMonth = (byte) calendar.get(2);
        this.mDay = (byte) calendar.get(5);
    }

    public void setDate(int i, int i2, int i3) {
        this.mYear = i;
        this.mMonth = (byte) i2;
        this.mDay = (byte) i3;
    }

    public void setDate(DateType dateType) {
        this.mYear = dateType.mYear;
        this.mMonth = dateType.mMonth;
        this.mDay = dateType.mDay;
    }

    public int getYear() {
        return this.mYear;
    }

    public int getMonth() {
        return this.mMonth;
    }

    public int getDay() {
        return this.mDay;
    }

    public int getDayOfWeek() {
        return getCalendar().get(7);
    }

    public int toIgoInt() {
        int i;
        int i2;
        if (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN) {
            i = (this.mYear << 16) | (this.mMonth << 8);
            i2 = this.mDay;
        } else {
            i = (this.mDay << 24) | (this.mMonth << 16);
            i2 = this.mYear & 65535;
        }
        return i | i2;
    }

    private Calendar getCalendar() {
        if (this.mCalendar == null) {
            this.mCalendar = new GregorianCalendar();
        }
        updateCalendar();
        return this.mCalendar;
    }

    private void updateCalendar() {
        this.mCalendar.set(this.mYear, this.mMonth, this.mDay);
    }

    public String toString() {
        return String.format(null, "Year: %d, Month: %d, Day: %d", Integer.valueOf(this.mYear), Byte.valueOf(this.mMonth), Byte.valueOf(this.mDay));
    }
}
