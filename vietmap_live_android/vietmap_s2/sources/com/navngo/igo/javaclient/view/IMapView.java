package com.navngo.igo.javaclient.view;

import android.graphics.PointF;
import android.view.KeyEvent;
import android.view.View;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface IMapView {
    boolean BeginPaint();

    void EndPaint();

    View asView();

    CommonMapView getCommonInterface();

    int get_Height();

    int get_Width();

    boolean hasValidSurface();

    PointF mapMousePoints(float f, float f2);

    void onPaintCallback(int i, int i2, int i3, int i4, int i5, int i6);

    void onPause();

    void onResume();

    boolean superonKeyDown(int i, KeyEvent keyEvent);

    boolean superonKeyUp(int i, KeyEvent keyEvent);
}
