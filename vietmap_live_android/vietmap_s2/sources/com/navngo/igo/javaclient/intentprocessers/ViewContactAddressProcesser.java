package com.navngo.igo.javaclient.intentprocessers;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import com.navngo.igo.contactshelper.ContactsHelper;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.address.StructuredAddress;
import com.navngo.igo.javaclient.androidgo.types.GCoor;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ViewContactAddressProcesser implements IIntentProcesser {
    private static final String logname = "ViewContactAddressProcesser";
    private Context mContext;

    public ViewContactAddressProcesser(Context context) {
        this.mContext = context;
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        String type;
        Uri data = intent.getData();
        try {
            type = intent.getType() != null ? intent.getType() : this.mContext.getContentResolver().getType(data);
        } catch (Exception unused) {
            type = null;
        }
        return "android.intent.action.VIEW".equals(intent.getAction()) && "content".equals(intent.getScheme()) && data != null && "com.android.contacts".equals(data.getHost()) && type != null && ContactsHelper.StructuredPostal.CONTENT_ITEM_TYPE.equals(type);
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        if (!matchesIntent(intent)) {
            return false;
        }
        ContentResolver contentResolver = this.mContext.getContentResolver();
        Cursor cursorQuery = contentResolver.query(intent.getData(), null, null, null, null);
        int columnIndex = cursorQuery.getColumnIndex("data10");
        int columnIndex2 = cursorQuery.getColumnIndex("data8");
        int columnIndex3 = cursorQuery.getColumnIndex("data7");
        int columnIndex4 = cursorQuery.getColumnIndex("data4");
        int columnIndex5 = cursorQuery.getColumnIndex("data9");
        int columnIndex6 = cursorQuery.getColumnIndex("data1");
        int columnIndex7 = cursorQuery.getColumnIndex(ContactsHelper.DataColumns.RAW_CONTACT_ID);
        boolean zMoveToFirst = cursorQuery.moveToFirst();
        if (zMoveToFirst) {
            boolean zIsNull = cursorQuery.isNull(columnIndex);
            String string = Config.def_additional_assets;
            StructuredAddress structuredAddress = new StructuredAddress(zIsNull ? Config.def_additional_assets : cursorQuery.getString(columnIndex), cursorQuery.isNull(columnIndex2) ? Config.def_additional_assets : cursorQuery.getString(columnIndex2), cursorQuery.isNull(columnIndex3) ? Config.def_additional_assets : cursorQuery.getString(columnIndex3), cursorQuery.isNull(columnIndex4) ? Config.def_additional_assets : cursorQuery.getString(columnIndex4), cursorQuery.isNull(columnIndex5) ? Config.def_additional_assets : cursorQuery.getString(columnIndex5));
            if (!cursorQuery.isNull(columnIndex6)) {
                string = cursorQuery.getString(columnIndex6);
            }
            String strReplaceAll = string.replaceAll("\n", " ");
            DebugLogger.D5(logname, String.format("Country = '%s', state = '%s', city = '%s', street = '%s', zip = '%s'. Full addr.: '%s'", structuredAddress.country, structuredAddress.state, structuredAddress.city, structuredAddress.street, structuredAddress.zip, strReplaceAll));
            Uri uriWithAppendedPath = Uri.withAppendedPath(ContentUris.withAppendedId(ContactsHelper.RawContacts.CONTENT_URI, cursorQuery.getInt(columnIndex7)), "data");
            DebugLogger.D5(logname, "GCOOR serach Uri: " + uriWithAppendedPath);
            Cursor cursorQuery2 = contentResolver.query(uriWithAppendedPath, null, String.format("%s = '%s'", ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.GCoor.CONTENT_ITEM_TYPE), null, null);
            if (cursorQuery2.moveToFirst()) {
                String string2 = cursorQuery2.getString(cursorQuery2.getColumnIndex("data1"));
                String string3 = cursorQuery2.getString(cursorQuery2.getColumnIndex("data2"));
                DebugLogger.D5(logname, "GCOOR found: " + string2 + " " + string3 + " !!!");
                AddressResolver.getResolver().jumpToPosition(new GCoor(Double.parseDouble(string2), Double.parseDouble(string3)));
            } else {
                DebugLogger.D5(logname, "GCOOR NOT found");
                AddressResolver.getResolver().jumpToAddressSelective(structuredAddress, strReplaceAll);
            }
            cursorQuery2.close();
        }
        cursorQuery.close();
        return zMoveToFirst;
    }
}
