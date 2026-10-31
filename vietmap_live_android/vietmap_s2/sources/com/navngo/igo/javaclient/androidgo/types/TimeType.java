package com.navngo.igo.javaclient.androidgo.types;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TimeType {
    private static final int MILLISECONDS_IN_AN_HOUR = 3600000;
    private static final int MILLISECONDS_IN_A_DAY = 86400000;
    private static final int MILLISECONDS_IN_A_MINUTE = 60000;
    private int mMilliseconds;

    public TimeType(int i, int i2, int i3) {
        setTime(i, i2, i3);
    }

    public TimeType(int i, int i2, int i3, int i4) {
        setTime(i, i2, i3, i4);
    }

    public TimeType(int i) {
        setTime(i);
    }

    public void setTime(int i, int i2, int i3) {
        setTime(i, i2, i3, 0);
    }

    public void setTime(int i, int i2, int i3, int i4) {
        this.mMilliseconds = (((((i * 60) + i2) * 60) + i3) * 1000) + i4;
    }

    public void setTime(TimeType timeType) {
        this.mMilliseconds = timeType.mMilliseconds;
    }

    public void setTime(int i) {
        this.mMilliseconds = ((i % MILLISECONDS_IN_A_DAY) + MILLISECONDS_IN_A_DAY) % MILLISECONDS_IN_A_DAY;
    }

    public int getHour() {
        return this.mMilliseconds / MILLISECONDS_IN_AN_HOUR;
    }

    public int getMin() {
        return (this.mMilliseconds / 60000) % 60;
    }

    public int getSec() {
        return (this.mMilliseconds / 1000) % 60;
    }

    public int getMillisec() {
        return this.mMilliseconds % 1000;
    }

    public int getMillisecFromMidnight() {
        return this.mMilliseconds;
    }

    public String toString() {
        return String.format(null, "Time: %2d:%2d:%2d.%3d", Integer.valueOf(getHour()), Integer.valueOf(getMin()), Integer.valueOf(getSec()), Integer.valueOf(getMillisec()));
    }
}
