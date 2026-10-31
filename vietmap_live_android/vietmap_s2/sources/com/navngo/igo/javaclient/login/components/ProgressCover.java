package com.navngo.igo.javaclient.login.components;

import android.content.Context;
import android.text.method.LinkMovementMethod;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.navngo.igo.javaclient.login.api.LoginError;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ProgressCover extends FrameLayout {
    private Button block;
    private RelativeLayout blockContainer;
    private TextView blockText;
    private Button close;
    private RelativeLayout errorContainer;
    private TextView errorText;
    private RelativeLayout progressContainer;
    private Button retry;
    private View view;

    public ProgressCover(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        View viewInflate = inflate(context, R.layout.component_progress_cover, null);
        this.view = viewInflate;
        this.progressContainer = (RelativeLayout) viewInflate.findViewById(R.id.pc_progressContainer);
        this.errorContainer = (RelativeLayout) this.view.findViewById(R.id.pc_errorContainer);
        TextView textView = (TextView) this.view.findViewById(R.id.pc_errorText);
        this.errorText = textView;
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        this.close = (Button) this.view.findViewById(R.id.pc_closeButton);
        this.retry = (Button) this.view.findViewById(R.id.pc_retryButton);
        this.blockContainer = (RelativeLayout) this.view.findViewById(R.id.pc_blockContainer);
        TextView textView2 = (TextView) this.view.findViewById(R.id.pc_blockText);
        this.blockText = textView2;
        textView2.setMovementMethod(LinkMovementMethod.getInstance());
        this.block = (Button) this.view.findViewById(R.id.pc_blockButton);
        this.view.setVisibility(4);
        this.progressContainer.setVisibility(4);
        this.errorContainer.setVisibility(4);
        this.blockContainer.setVisibility(4);
        this.close.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.components.ProgressCover$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m6lambda$new$0$comnavngoigojavaclientlogincomponentsProgressCover(view);
            }
        });
        addView(this.view);
    }

    /* JADX INFO: renamed from: lambda$new$0$com-navngo-igo-javaclient-login-components-ProgressCover, reason: not valid java name */
    /* synthetic */ void m6lambda$new$0$comnavngoigojavaclientlogincomponentsProgressCover(View view) {
        onDone();
    }

    public void onProgress() {
        this.view.setVisibility(0);
        this.progressContainer.setVisibility(0);
        this.errorContainer.setVisibility(4);
        this.blockContainer.setVisibility(4);
    }

    public void onError(LoginError loginError, View.OnClickListener onClickListener) {
        this.view.setVisibility(0);
        this.progressContainer.setVisibility(4);
        this.errorContainer.setVisibility(0);
        this.blockContainer.setVisibility(4);
        this.errorText.setText(loginError.stringRes);
        if (loginError.equals(LoginError.NO_INTERNET) || loginError.equals(LoginError.OTHER)) {
            this.retry.setOnClickListener(onClickListener);
            this.retry.setEnabled(true);
        } else {
            this.retry.setEnabled(false);
        }
    }

    public void onBlock(LoginError loginError, View.OnClickListener onClickListener) {
        this.view.setVisibility(0);
        this.progressContainer.setVisibility(4);
        this.errorContainer.setVisibility(4);
        this.blockContainer.setVisibility(0);
        this.blockText.setText(loginError.stringRes);
        this.block.setOnClickListener(onClickListener);
        this.block.setEnabled(true);
    }

    public void onDone() {
        this.view.setVisibility(4);
        this.progressContainer.setVisibility(4);
        this.errorContainer.setVisibility(4);
        this.retry.setOnClickListener(null);
    }
}
