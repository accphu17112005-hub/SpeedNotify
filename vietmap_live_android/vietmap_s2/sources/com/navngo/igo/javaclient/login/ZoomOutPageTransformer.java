package com.navngo.igo.javaclient.login;

import android.view.View;
import androidx.viewpager2.widget.ViewPager2;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ZoomOutPageTransformer implements ViewPager2.PageTransformer {
    private static final float MIN_ALPHA = 0.5f;
    private static final float MIN_SCALE = 0.85f;

    @Override // androidx.viewpager2.widget.ViewPager2.PageTransformer
    public void transformPage(View view, float f) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (f < -1.0f) {
            view.setAlpha(0.0f);
            return;
        }
        if (f <= 1.0f) {
            float fMax = Math.max(MIN_SCALE, 1.0f - Math.abs(f));
            float f2 = 1.0f - fMax;
            float f3 = (height * f2) / 2.0f;
            float f4 = (width * f2) / 2.0f;
            if (f < 0.0f) {
                view.setTranslationX(f4 - (f3 / 2.0f));
            } else {
                view.setTranslationX((-f4) + (f3 / 2.0f));
            }
            view.setScaleX(fMax);
            view.setScaleY(fMax);
            view.setAlpha((((fMax - MIN_SCALE) / 0.14999998f) * MIN_ALPHA) + MIN_ALPHA);
            return;
        }
        view.setAlpha(0.0f);
    }
}
