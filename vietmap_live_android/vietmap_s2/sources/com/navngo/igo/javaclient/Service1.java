package com.navngo.igo.javaclient;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface Service1 extends IInterface {

    public static class Default implements Service1 {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.navngo.igo.javaclient.Service1
        public boolean function1(String str, String[] strArr) throws RemoteException {
            return false;
        }
    }

    boolean function1(String str, String[] strArr) throws RemoteException;

    public static abstract class Stub extends Binder implements Service1 {
        private static final String DESCRIPTOR = "com.navngo.igo.javaclient.Service1";
        static final int TRANSACTION_function1 = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static Service1 asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof Service1)) {
                return (Service1) iInterfaceQueryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1) {
                if (i == 1598968902) {
                    parcel2.writeString(DESCRIPTOR);
                    return true;
                }
                return super.onTransact(i, parcel, parcel2, i2);
            }
            parcel.enforceInterface(DESCRIPTOR);
            String string = parcel.readString();
            int i3 = parcel.readInt();
            String[] strArr = i3 < 0 ? null : new String[i3];
            boolean zFunction1 = function1(string, strArr);
            parcel2.writeNoException();
            parcel2.writeInt(zFunction1 ? 1 : 0);
            parcel2.writeStringArray(strArr);
            return true;
        }

        private static class Proxy implements Service1 {
            public static Service1 sDefaultImpl;
            private IBinder mRemote;

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            @Override // com.navngo.igo.javaclient.Service1
            public boolean function1(String str, String[] strArr) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    parcelObtain.writeString(str);
                    if (strArr == null) {
                        parcelObtain.writeInt(-1);
                    } else {
                        parcelObtain.writeInt(strArr.length);
                    }
                    if (!this.mRemote.transact(1, parcelObtain, parcelObtain2, 0) && Stub.getDefaultImpl() != null) {
                        return Stub.getDefaultImpl().function1(str, strArr);
                    }
                    parcelObtain2.readException();
                    boolean z = parcelObtain2.readInt() != 0;
                    parcelObtain2.readStringArray(strArr);
                    return z;
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }
        }

        public static boolean setDefaultImpl(Service1 service1) {
            if (Proxy.sDefaultImpl != null) {
                throw new IllegalStateException("setDefaultImpl() called twice");
            }
            if (service1 == null) {
                return false;
            }
            Proxy.sDefaultImpl = service1;
            return true;
        }

        public static Service1 getDefaultImpl() {
            return Proxy.sDefaultImpl;
        }
    }
}
