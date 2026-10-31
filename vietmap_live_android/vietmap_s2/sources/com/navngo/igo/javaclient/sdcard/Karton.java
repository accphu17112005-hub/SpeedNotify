package com.navngo.igo.javaclient.sdcard;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Karton extends HashMap<String, String> {
    private static final long serialVersionUID = -322401823167626047L;

    public Karton() {
    }

    public Karton(int i, float f) {
        super(i, f);
    }

    public Karton(int i) {
        super(i);
    }

    public Karton(Map<? extends String, ? extends String> map) {
        super(map);
    }

    public String[] sortKeysByValue(final String[] strArr) {
        Integer[] numArr = new Integer[strArr.length];
        int length = strArr.length;
        while (true) {
            int i = length - 1;
            if (length <= 0) {
                break;
            }
            numArr[i] = Integer.valueOf(i);
            length = i;
        }
        Arrays.sort(numArr, new Comparator<Integer>() { // from class: com.navngo.igo.javaclient.sdcard.Karton.1
            @Override // java.util.Comparator
            public int compare(Integer num, Integer num2) {
                return Karton.this.get(strArr[num.intValue()]).compareTo(Karton.this.get(strArr[num2.intValue()]));
            }
        });
        String[] strArr2 = new String[strArr.length];
        int length2 = strArr.length;
        while (true) {
            int i2 = length2 - 1;
            if (length2 <= 0) {
                return strArr2;
            }
            strArr2[i2] = strArr[numArr[i2].intValue()];
            length2 = i2;
        }
    }
}
