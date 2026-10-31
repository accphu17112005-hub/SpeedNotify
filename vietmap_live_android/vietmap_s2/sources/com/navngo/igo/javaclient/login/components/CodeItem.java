package com.navngo.igo.javaclient.login.components;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.core.content.ContextCompat;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CodeItem extends FrameLayout {
    private TextView code;
    private AppCompatImageView cursor;
    private View view;

    public CodeItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        View viewInflate = inflate(context, R.layout.component_code_item, null);
        this.view = viewInflate;
        this.code = (TextView) viewInflate.findViewById(R.id.ci_tvCode);
        this.cursor = (AppCompatImageView) this.view.findViewById(R.id.ci_ivCursor);
        this.code.setTextColor(ContextCompat.getColor(context, R.color.InactiveGray));
        this.code.setText("0");
        this.cursor.setVisibility(4);
        addView(this.view);
    }

    public void setCode(char c) {
        this.code.setTextColor(ContextCompat.getColor(getContext(), R.color.PrimaryText));
        this.code.setText(String.valueOf(c));
    }

    public void clearCode() {
        this.code.setTextColor(ContextCompat.getColor(getContext(), R.color.InactiveGray));
        this.code.setText("0");
    }

    public void setCursor(boolean z) {
        if (z) {
            this.cursor.setVisibility(0);
        } else {
            this.cursor.setVisibility(4);
        }
    }
}
