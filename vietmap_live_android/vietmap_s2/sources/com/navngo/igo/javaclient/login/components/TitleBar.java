package com.navngo.igo.javaclient.login.components;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TitleBar extends FrameLayout {
    private AppCompatImageView back;
    private TextView titleText;
    private View view;

    public TitleBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        View viewInflate = inflate(context, R.layout.component_title_bar, null);
        this.view = viewInflate;
        this.back = (AppCompatImageView) viewInflate.findViewById(R.id.tb_ibBack);
        this.titleText = (TextView) this.view.findViewById(R.id.tb_tvTitle);
        this.back.setVisibility(4);
        addView(this.view);
    }

    public void setOnBack(final View.OnClickListener onClickListener) {
        this.back.setVisibility(0);
        this.back.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.components.TitleBar$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m7lambda$setOnBack$0$comnavngoigojavaclientlogincomponentsTitleBar(onClickListener, view);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$setOnBack$0$com-navngo-igo-javaclient-login-components-TitleBar, reason: not valid java name */
    /* synthetic */ void m7lambda$setOnBack$0$comnavngoigojavaclientlogincomponentsTitleBar(View.OnClickListener onClickListener, View view) {
        if (this.back.getAlpha() == 1.0f) {
            onClickListener.onClick(view);
        }
    }

    public void clearOnBack() {
        this.back.setVisibility(4);
        this.back.setOnClickListener(null);
    }

    public void disableOnBack() {
        this.back.setAlpha(0.2f);
    }

    public void enableOnBack() {
        this.back.setAlpha(1.0f);
    }

    public boolean isBackEnabled() {
        return this.back.getAlpha() == 1.0f;
    }

    public void setTitle(String str) {
        this.titleText.setText(str);
    }

    public void setTitle(int i) {
        this.titleText.setText(i);
    }

    public void setTitleColor(int i) {
        ((TextView) this.view.findViewById(R.id.tb_tvTitle)).setTextColor(i);
    }

    public String getTitleText() {
        return ((TextView) this.view.findViewById(R.id.tb_tvTitle)).getText().toString();
    }
}
