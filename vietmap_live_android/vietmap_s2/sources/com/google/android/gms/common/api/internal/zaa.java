package com.google.android.gms.common.api.internal;

import android.app.Activity;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class zaa extends ActivityLifecycleObserver {
    private final WeakReference<C0007zaa> zack;

    public zaa(Activity activity) {
        this(C0007zaa.zaa(activity));
    }

    private zaa(C0007zaa c0007zaa) {
        this.zack = new WeakReference<>(c0007zaa);
    }

    @Override // com.google.android.gms.common.api.internal.ActivityLifecycleObserver
    public final ActivityLifecycleObserver onStopCallOnce(Runnable runnable) {
        C0007zaa c0007zaa = this.zack.get();
        if (c0007zaa == null) {
            throw new IllegalStateException("The target activity has already been GC'd");
        }
        c0007zaa.zaa(runnable);
        return this;
    }

    /* JADX INFO: renamed from: com.google.android.gms.common.api.internal.zaa$zaa, reason: collision with other inner class name */
    static class C0007zaa extends LifecycleCallback {
        private List<Runnable> zacl;

        /* JADX INFO: Access modifiers changed from: private */
        public static C0007zaa zaa(Activity activity) {
            C0007zaa c0007zaa;
            synchronized (activity) {
                LifecycleFragment fragment = getFragment(activity);
                c0007zaa = (C0007zaa) fragment.getCallbackOrNull("LifecycleObserverOnStop", C0007zaa.class);
                if (c0007zaa == null) {
                    c0007zaa = new C0007zaa(fragment);
                }
            }
            return c0007zaa;
        }

        private C0007zaa(LifecycleFragment lifecycleFragment) {
            super(lifecycleFragment);
            this.zacl = new ArrayList();
            this.mLifecycleFragment.addCallback("LifecycleObserverOnStop", this);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final synchronized void zaa(Runnable runnable) {
            this.zacl.add(runnable);
        }

        @Override // com.google.android.gms.common.api.internal.LifecycleCallback
        public void onStop() {
            List<Runnable> list;
            synchronized (this) {
                list = this.zacl;
                this.zacl = new ArrayList();
            }
            Iterator<Runnable> it = list.iterator();
            while (it.hasNext()) {
                it.next().run();
            }
        }
    }
}
