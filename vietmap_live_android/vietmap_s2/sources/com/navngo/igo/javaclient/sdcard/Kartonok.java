package com.navngo.igo.javaclient.sdcard;

import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Vector;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Kartonok extends Vector<Karton> {
    private static final long serialVersionUID = -322401823167626049L;

    public Kartonok() {
    }

    public Kartonok(Collection<? extends Karton> collection) {
        super(collection);
    }

    public Kartonok(int i, int i2) {
        super(i, i2);
    }

    public Kartonok(int i) {
        super(i);
    }

    public void sort(final String str) {
        Karton[] kartonArr = (Karton[]) toArray(new Karton[size()]);
        Arrays.sort(kartonArr, new Comparator<Karton>() { // from class: com.navngo.igo.javaclient.sdcard.Kartonok.1
            @Override // java.util.Comparator
            public int compare(Karton karton, Karton karton2) {
                return karton.get(str).compareTo(karton2.get(str));
            }
        });
        System.arraycopy(kartonArr, 0, ((Vector) this).elementData, 0, ((Vector) this).elementCount);
    }

    public void reverse() {
        int i = ((Vector) this).elementCount;
        int i2 = 0;
        while (true) {
            i--;
            if (i <= i2) {
                return;
            }
            Object obj = ((Vector) this).elementData[i];
            ((Vector) this).elementData[i] = ((Vector) this).elementData[i2];
            ((Vector) this).elementData[i2] = obj;
            i2++;
        }
    }

    public Kartonok pivot(String[] strArr, String[] strArr2) {
        Kartonok kartonok = new Kartonok(strArr.length);
        int size = size();
        for (String str : strArr) {
            Karton karton = new Karton(size);
            int i = size;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    karton.put(strArr2[i2], get(i2).get(str));
                    i = i2;
                }
            }
            kartonok.add(karton);
        }
        return kartonok;
    }
}
