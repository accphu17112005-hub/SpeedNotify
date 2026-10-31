package com.navngo.igo.javaclient.login.api;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Observable<T> {
    private List<OnChangeListener<T>> listenerList = new ArrayList();
    private T value;

    public interface OnChangeListener<T> {
        void onChange(Observable<T> observable, T t);
    }

    public Observable(T t) {
        this.value = t;
    }

    public void addAndExecuteOnChangeListener(OnChangeListener<T> onChangeListener) {
        addOnChangeListener(onChangeListener);
        onChangeListener.onChange(this, this.value);
    }

    public void addOnChangeListener(OnChangeListener<T> onChangeListener) {
        if (this.listenerList.contains(onChangeListener)) {
            return;
        }
        this.listenerList.add(onChangeListener);
    }

    public void removeOnChangeListener(OnChangeListener<T> onChangeListener) {
        if (this.listenerList.contains(onChangeListener)) {
            this.listenerList.remove(onChangeListener);
        }
    }

    public T getValue() {
        return this.value;
    }

    public void setValue(T t) {
        this.value = t;
    }

    public void postValue(T t) {
        Iterator<OnChangeListener<T>> it = this.listenerList.iterator();
        while (it.hasNext()) {
            it.next().onChange(this, t);
        }
        setValue(t);
    }

    public void postValue() {
        Iterator<OnChangeListener<T>> it = this.listenerList.iterator();
        while (it.hasNext()) {
            it.next().onChange(this, this.value);
        }
    }
}
