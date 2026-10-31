package com.google.android.gms.common.api;

import com.google.android.gms.common.api.PendingResult;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zaa implements PendingResult.StatusListener {
    private final /* synthetic */ Batch zabd;

    zaa(Batch batch) {
        this.zabd = batch;
    }

    @Override // com.google.android.gms.common.api.PendingResult.StatusListener
    public final void onComplete(Status status) {
        synchronized (this.zabd.mLock) {
            if (this.zabd.isCanceled()) {
                return;
            }
            if (status.isCanceled()) {
                Batch.zaa(this.zabd, true);
            } else if (!status.isSuccess()) {
                Batch.zab(this.zabd, true);
            }
            Batch.zab(this.zabd);
            if (this.zabd.zaaz == 0) {
                if (this.zabd.zabb) {
                    super/*com.google.android.gms.common.api.internal.BasePendingResult*/.cancel();
                } else {
                    Status status2 = this.zabd.zaba ? new Status(13) : Status.RESULT_SUCCESS;
                    Batch batch = this.zabd;
                    batch.setResult(new BatchResult(status2, batch.zabc));
                }
            }
        }
    }
}
