package com.navngo.igo.javaclient.login;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;
import com.navngo.igo.javaclient.login.fragments.RegisterPhoneView;
import com.navngo.igo.javaclient.login.fragments.VerifyPhoneView;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class CustomPagerAdapter extends FragmentStateAdapter {
    private static int NUM_ITEMS = 2;

    public CustomPagerAdapter(FragmentActivity fragmentActivity) {
        super(fragmentActivity);
    }

    @Override // androidx.viewpager2.adapter.FragmentStateAdapter
    public Fragment createFragment(int i) {
        if (i == 0) {
            return new RegisterPhoneView();
        }
        if (i != 1) {
            return null;
        }
        return new VerifyPhoneView();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return NUM_ITEMS;
    }
}
