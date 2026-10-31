package com.navngo.igo.javaclient.functors;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.Contacts;
import android.provider.ContactsContract;
import com.navngo.igo.contactshelper.ContactsHelper;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.activityresulthandler.ContactPickerResultHandler;
import com.navngo.igo.javaclient.activityresulthandler.EditContactResultHandler;
import com.navngo.igo.javaclient.address.StructuredAddress;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.AndroidGoOutputStream;
import com.navngo.igo.javaclient.androidgo.OutArgs;
import com.navngo.igo.javaclient.androidgo.SysConfig;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import com.navngo.igo.javaclient.utils.GPSUtils;
import com.navngo.program.ProgramPhases;
import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum MailSmsContacts implements IFunctorCollection {
    INSTANCE;

    private static final String logname = "MailSmsContacts";
    private Uri mRecentlyInsertedContact = null;
    private volatile boolean oldInsertContactMethod = true;
    private ArrayList<StructuredAddress> mLastContactAdresses = null;
    private Context mContext = Application.anApplication.getApplicationContext();

    MailSmsContacts() {
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.STARTUP, true, new Runnable() { // from class: com.navngo.igo.javaclient.functors.MailSmsContacts.1
            @Override // java.lang.Runnable
            public void run() {
                MailSmsContacts.this.oldInsertContactMethod = SysConfig.getInstance().getBool("android", "old_insert_contact_method", MailSmsContacts.this.oldInsertContactMethod);
            }
        });
    }

    private boolean checkPermission() {
        return PermissionHandler.get().isPermissionGranted("android.permission.READ_CONTACTS");
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.contact.getAllNames", this, "getContactAllNames");
        androidGo.registerFunctor("android.contact.getAllAddr", this, "getContactAllAddr");
        androidGo.registerFunctor("android.contact.insert", this, "insertContact");
        androidGo.registerFunctor("android.contact.getDetailsCached", this, "getContactDetailsCached");
        androidGo.registerFunctor("android.contact.getNextCachedAddress", this, "getCachedContactAddress");
        if (Config.getBool("android", "register_functors", true)) {
            androidGo.registerFunctor("android.sendMail", this, "uiSendMail");
            androidGo.registerFunctor("android.sendSms", this, "uiSendSms");
            androidGo.registerFunctor("android.insertContact", this, "uiInsertContact");
            androidGo.registerFunctor("android.call", this, "uiCall");
            androidGo.registerFunctor("android.contact.show", this, "uiShowContact");
            androidGo.registerFunctor("android.contact.showAll", this, "uiShowContacts");
        }
    }

    private void startEditContactIntentForResult(Uri uri) {
        if (Config.getBool("android", "register_functors", true)) {
            IgoActivity igoActivity = Application.getIgoActivity();
            if (igoActivity == null) {
                DebugLogger.D2(logname, "IgoActivity is null in startEditContactIntentForResult!");
                return;
            }
            Intent intent = new Intent("android.intent.action.EDIT");
            intent.setData(uri);
            this.mRecentlyInsertedContact = uri;
            igoActivity.startActivityForResult(intent, EditContactResultHandler.REQUEST_CODE);
        }
    }

    public void uiInsertContact(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11) {
        if (checkPermission()) {
            DebugLogger.D5(logname, "Insert Contact: " + str + "," + str5 + str6 + str7 + "," + str9 + "," + str10 + "," + str11 + "(" + str2 + ")");
            ContentResolver contentResolver = this.mContext.getContentResolver();
            ContentValues contentValues = new ContentValues();
            if (!this.oldInsertContactMethod) {
                Uri uriWrapWithSyncAdapter = wrapWithSyncAdapter(ContactsHelper.RawContacts.CONTENT_URI);
                DebugLogger.D5(logname, "RawContact base Uri: " + uriWrapWithSyncAdapter);
                Uri uriInsert = contentResolver.insert(uriWrapWithSyncAdapter, contentValues);
                DebugLogger.D5(logname, "Inserted Uri (rawcontact): " + uriInsert);
                Uri uriWithAppendedPath = Uri.withAppendedPath(uriInsert, "data");
                contentValues.clear();
                contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredName.CONTENT_ITEM_TYPE);
                contentValues.put("data1", str);
                contentValues.put("data2", str);
                DebugLogger.D5(logname, "Inserted Uri (name): " + contentResolver.insert(uriWithAppendedPath, contentValues));
                Uri uriWithAppendedPath2 = Uri.withAppendedPath(uriInsert, "data");
                contentValues.clear();
                contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredPostal.CONTENT_ITEM_TYPE);
                contentValues.put("data2", (Integer) 1);
                contentValues.put("data10", str3);
                contentValues.put("data8", str4);
                contentValues.put("data7", str5);
                contentValues.put("data4", str6 + " " + str7);
                contentValues.put("data9", str8);
                DebugLogger.D5(logname, "Inserted Uri (address): " + contentResolver.insert(uriWithAppendedPath2, contentValues));
                if (str10.length() > 0) {
                    Uri uriWithAppendedPath3 = Uri.withAppendedPath(uriInsert, "data");
                    contentValues.clear();
                    contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.Phone.CONTENT_ITEM_TYPE);
                    contentValues.put("data2", (Integer) 1);
                    contentValues.put("data1", str10);
                    DebugLogger.D5(logname, "Inserted Uri (phone): " + contentResolver.insert(uriWithAppendedPath3, contentValues));
                }
                if (str11.length() > 0) {
                    Uri uriWithAppendedPath4 = Uri.withAppendedPath(uriInsert, "data");
                    contentValues.clear();
                    contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.Note.CONTENT_ITEM_TYPE);
                    contentValues.put("data1", str11);
                    DebugLogger.D5(logname, "Inserted Uri (notes): " + contentResolver.insert(uriWithAppendedPath4, contentValues));
                }
                if (str9.length() > 0) {
                    Uri uriWithAppendedPath5 = Uri.withAppendedPath(uriInsert, "data");
                    contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.GCoor.CONTENT_ITEM_TYPE);
                    GCoor gCoorFromString = GPSUtils.parseGCoorFromString(str9);
                    DebugLogger.D5(logname, "Coor parsed: " + gCoorFromString.latitude + " " + gCoorFromString.longitude);
                    contentValues.put("data1", Double.toString(gCoorFromString.latitude));
                    contentValues.put("data2", Double.toString(gCoorFromString.longitude));
                    DebugLogger.D5(logname, "Inserted Uri (Coor): " + contentResolver.insert(uriWithAppendedPath5, contentValues));
                }
                contentValues.clear();
                contentValues.put(ContactsHelper.RawContactsColumns.AGGREGATION_MODE, (Integer) 1);
                contentValues.putNull(ContactsHelper.SyncColumns.SOURCE_ID);
                DebugLogger.D5(logname, "Updated Rawcontact " + uriInsert + "; updated rows: " + contentResolver.update(uriInsert, contentValues, null, null));
                startEditContactIntentForResult(uriInsert);
                return;
            }
            contentValues.clear();
            contentValues.put("name", str);
            if (str11.length() > 0) {
                contentValues.put("notes", str11);
            }
            Uri uriInsert2 = contentResolver.insert(Contacts.People.CONTENT_URI, contentValues);
            DebugLogger.D5(getClass().toString(), "Base Contact Uri: " + uriInsert2);
            if (str2.length() > 0 || str9.length() > 0) {
                StringBuilder sb = new StringBuilder();
                sb.append(" ");
                sb.append(str2);
                if (str9.length() > 0) {
                    sb.append(" ");
                    sb.append(GPSUtils.normalizeGPSFormatted(str9.toString(), 0));
                }
                contentValues.clear();
                contentValues.put("kind", (Integer) 2);
                contentValues.put("data", sb.toString());
                contentValues.put("type", (Integer) 1);
                Uri uriWithAppendedPath6 = Uri.withAppendedPath(uriInsert2, "contact_methods");
                DebugLogger.D5(getClass().toString(), "Postal Uri: " + uriWithAppendedPath6);
                Uri uriInsert3 = contentResolver.insert(uriWithAppendedPath6, contentValues);
                DebugLogger.D5(getClass().toString(), "Inserted Uri (postal): " + uriInsert3);
            }
            if (str10.length() > 0) {
                contentValues.clear();
                contentValues.put("number", str10);
                contentValues.put("type", (Integer) 1);
                contentResolver.insert(Uri.withAppendedPath(uriInsert2, "phones"), contentValues);
            }
            startEditContactIntentForResult(uriInsert2);
        }
    }

    public void uiCall(Object obj) {
        if (obj != null) {
            Intent intent = new Intent("android.intent.action.DIAL");
            intent.addFlags(268435456);
            intent.setData(Uri.parse("tel:" + obj));
            this.mContext.startActivity(intent);
        }
    }

    public void uiSendMail(String str, String str2, String str3, GCoor gCoor, String str4, String str5) {
        if (checkPermission()) {
            DebugLogger.D5(logname, String.format("SendMail: subject: %s. name = '%s' address = '%s' coord = '%s' phone = '%s' notes = '%s'", str, str2, str3, gCoor, str4, str5));
            if (str2.length() > 0 || gCoor.isValid()) {
                Intent intent = new Intent("android.intent.action.SEND");
                intent.setType("text/plain");
                intent.putExtra("android.intent.extra.SUBJECT", str);
                intent.putExtra("android.intent.extra.EMAIL", new String[]{Config.def_additional_assets});
                StringBuilder sbComposeMessageText = composeMessageText(str2, str3, gCoor, str4, str5);
                if (sbComposeMessageText.length() > 0) {
                    intent.putExtra("android.intent.extra.TEXT", sbComposeMessageText.toString());
                    DebugLogger.D5(logname, "Sending Email with data '" + ((Object) sbComposeMessageText) + "'");
                    this.mContext.startActivity(Intent.createChooser(intent, "SendMail"));
                    return;
                }
                Application.getIgoActivity().MessageBox("Current position is unknown", "Warning", 0);
                return;
            }
            Application.getIgoActivity().MessageBox("Current position is unknown", "Warning", 0);
        }
    }

    public void uiSendSms(String str, String str2, GCoor gCoor, String str3, String str4) {
        if (checkPermission()) {
            DebugLogger.D4(logname, "SendSMS: " + str + "," + str2 + "," + gCoor + "," + str3 + "," + str4);
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setType("vnd.android-dir/mms-sms");
            StringBuilder sbComposeMessageText = composeMessageText(str, str2, gCoor, str3, str4);
            if (sbComposeMessageText.length() > 0) {
                intent.putExtra("sms_body", sbComposeMessageText.toString());
                DebugLogger.D5(logname, "Sending SMS with data '" + ((Object) sbComposeMessageText) + "'");
                this.mContext.startActivity(intent);
                return;
            }
            Application.getIgoActivity().MessageBox("Current position is unknown", "Warning", 0);
        }
    }

    private Uri wrapWithSyncAdapter(Uri uri) {
        return uri.buildUpon().appendQueryParameter(ContactsHelper.CALLER_IS_SYNCADAPTER, "true").build();
    }

    private StringBuilder composeMessageText(String str, String str2, GCoor gCoor, String str3, String str4) {
        StringBuilder sb = new StringBuilder();
        if (gCoor.isValid()) {
            sb.append(" ");
            sb.append("http://maps.google.com/maps?q=");
            sb.append(gCoor.latitude);
            sb.append(",");
            sb.append(gCoor.longitude);
            sb.append(" ");
        }
        if (str.length() > 0 && (str2.length() <= 0 || !str2.startsWith(str))) {
            sb.append(str);
            sb.append(" ");
        }
        if (str2.length() > 0) {
            sb.append(str2);
            sb.append(" ");
        }
        if (gCoor.isValid()) {
            sb.append(GPSUtils.encodeGPSCoord(gCoor));
            sb.append(" ");
        }
        if (str3.length() > 0) {
            sb.append(str3);
            sb.append(" ");
        }
        if (str4.length() > 0) {
            sb.append(str4);
            sb.append(" ");
        }
        sb.delete(sb.length() - 1, sb.length());
        return sb;
    }

    public ByteArrayOutputStreamDirect.ByteArrayRegion getContactAllNames() throws IOException {
        if (!checkPermission()) {
            ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect(1000);
            new AndroidGoOutputStream(byteArrayOutputStreamDirect).writeInt(0);
            return byteArrayOutputStreamDirect.getBuffer();
        }
        Cursor cursorQuery = this.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{ContactsHelper.RawContactsColumns.CONTACT_ID, "data3", "data2", "data1"}, "mimetype='vnd.android.cursor.item/name'", null, null);
        int count = cursorQuery != null ? cursorQuery.getCount() : 0;
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect2 = new ByteArrayOutputStreamDirect(count > 0 ? (count * 16) + 200 : 1000);
        AndroidGoOutputStream androidGoOutputStream = new AndroidGoOutputStream(byteArrayOutputStreamDirect2);
        androidGoOutputStream.writeInt(count);
        for (int i = 0; i < count; i++) {
            cursorQuery.moveToPosition(i);
            androidGoOutputStream.writeInt(cursorQuery.getInt(0));
            androidGoOutputStream.writeUtf8(cursorQuery.getString(1));
            androidGoOutputStream.writeUtf8(cursorQuery.getString(2));
            androidGoOutputStream.writeUtf8(cursorQuery.getString(3));
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return byteArrayOutputStreamDirect2.getBuffer();
    }

    public ByteArrayOutputStreamDirect.ByteArrayRegion getContactAllAddr() throws IOException {
        if (!checkPermission()) {
            ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect(10000);
            new AndroidGoOutputStream(byteArrayOutputStreamDirect).writeInt(0);
            return byteArrayOutputStreamDirect.getBuffer();
        }
        Cursor cursorQuery = this.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{ContactsHelper.RawContactsColumns.CONTACT_ID, "data10", "data7", "data9", "data4", "data8", "data2"}, "mimetype='vnd.android.cursor.item/postal-address_v2'", null, null);
        int count = cursorQuery != null ? cursorQuery.getCount() : 0;
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect2 = new ByteArrayOutputStreamDirect(10000);
        AndroidGoOutputStream androidGoOutputStream = new AndroidGoOutputStream(byteArrayOutputStreamDirect2);
        androidGoOutputStream.writeInt(count);
        for (int i = 0; i < count; i++) {
            cursorQuery.moveToPosition(i);
            androidGoOutputStream.writeInt(cursorQuery.getInt(0));
            androidGoOutputStream.writeInt(cursorQuery.getInt(6));
            boolean zIsNull = cursorQuery.isNull(1);
            String string = Config.def_additional_assets;
            androidGoOutputStream.writeUtf8(zIsNull ? Config.def_additional_assets : cursorQuery.getString(1));
            androidGoOutputStream.writeUtf8(cursorQuery.isNull(2) ? Config.def_additional_assets : cursorQuery.getString(2));
            androidGoOutputStream.writeUtf8(cursorQuery.isNull(3) ? Config.def_additional_assets : cursorQuery.getString(3));
            if (!cursorQuery.isNull(4)) {
                string = cursorQuery.getString(4);
            }
            androidGoOutputStream.writeUtf8(string);
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return byteArrayOutputStreamDirect2.getBuffer();
    }

    public byte[] getAllContactIDs() {
        Cursor cursorQuery = this.mContext.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"_id"}, null, null, null);
        if (cursorQuery == null) {
            return new byte[0];
        }
        byte[] bArr = new byte[cursorQuery.getCount() * 4];
        for (int i = 0; i < cursorQuery.getCount(); i++) {
            cursorQuery.moveToPosition(i);
            int i2 = cursorQuery.getInt(cursorQuery.getColumnIndex("_id"));
            int i3 = i * 4;
            bArr[i3] = (byte) (i2 >>> 24);
            bArr[i3 + 1] = (byte) (i2 >>> 16);
            bArr[i3 + 2] = (byte) (i2 >>> 8);
            bArr[i3 + 3] = (byte) i2;
        }
        cursorQuery.close();
        return bArr;
    }

    public OutArgs getContactDetails(int i) {
        String strGetContactColumn;
        String strGetContactColumn2;
        String str;
        MailSmsContacts mailSmsContacts = this;
        Integer numValueOf = Integer.valueOf(i);
        String str2 = "data2";
        int i2 = 0;
        Cursor cursorQuery = mailSmsContacts.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"data3", "data2", "data1"}, "contact_id=? AND mimetype='vnd.android.cursor.item/name'", new String[]{numValueOf.toString()}, null);
        String str3 = Config.def_additional_assets;
        if (cursorQuery == null || cursorQuery.getCount() <= 0) {
            strGetContactColumn = Config.def_additional_assets;
            strGetContactColumn2 = strGetContactColumn;
        } else {
            cursorQuery.moveToFirst();
            strGetContactColumn = mailSmsContacts.GetContactColumn(cursorQuery, "data3");
            strGetContactColumn2 = mailSmsContacts.GetContactColumn(cursorQuery, "data2");
            if (strGetContactColumn.length() == 0) {
                strGetContactColumn = mailSmsContacts.GetContactColumn(cursorQuery, "data1");
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        Cursor cursorQuery2 = mailSmsContacts.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"data4", "data7", "data9", "data8", "data10", "data2"}, "contact_id=? AND mimetype='vnd.android.cursor.item/postal-address_v2'", new String[]{numValueOf.toString()}, null);
        String str4 = Config.def_additional_assets;
        String str5 = str4;
        String str6 = str5;
        String str7 = str6;
        String str8 = str7;
        String str9 = str8;
        String str10 = str9;
        String str11 = str10;
        String str12 = str11;
        String str13 = str12;
        String str14 = str13;
        String str15 = str14;
        String str16 = str15;
        String str17 = str16;
        String str18 = str17;
        String str19 = str18;
        String str20 = str19;
        String str21 = str20;
        String str22 = str21;
        while (cursorQuery2 != null && i2 < cursorQuery2.getCount()) {
            cursorQuery2.moveToPosition(i2);
            int columnIndex = cursorQuery2.getColumnIndex(str2);
            String str23 = str2;
            if (columnIndex >= 0) {
                int i3 = cursorQuery2.getInt(columnIndex);
                str = str10;
                String strGetContactColumn3 = mailSmsContacts.GetContactColumn(cursorQuery2, "data4");
                String strGetContactColumn4 = mailSmsContacts.GetContactColumn(cursorQuery2, "data7");
                String strGetContactColumn5 = mailSmsContacts.GetContactColumn(cursorQuery2, "data9");
                String strGetContactColumn6 = mailSmsContacts.GetContactColumn(cursorQuery2, "data8");
                String strGetContactColumn7 = mailSmsContacts.GetContactColumn(cursorQuery2, "data10");
                if (i3 == 1) {
                    str7 = strGetContactColumn7;
                    str10 = str;
                    str3 = strGetContactColumn3;
                    str4 = strGetContactColumn4;
                    str5 = strGetContactColumn5;
                    str6 = strGetContactColumn6;
                } else if (i3 == 2) {
                    str12 = strGetContactColumn7;
                    str8 = strGetContactColumn3;
                    str9 = strGetContactColumn4;
                    str10 = strGetContactColumn5;
                    str11 = strGetContactColumn6;
                } else if (i3 == 3) {
                    str17 = strGetContactColumn7;
                    str10 = str;
                    str13 = strGetContactColumn3;
                    str14 = strGetContactColumn4;
                    str15 = strGetContactColumn5;
                    str16 = strGetContactColumn6;
                } else if (i3 == 0) {
                    str22 = strGetContactColumn7;
                    str10 = str;
                    str18 = strGetContactColumn3;
                    str19 = strGetContactColumn4;
                    str20 = strGetContactColumn5;
                    str21 = strGetContactColumn6;
                } else {
                    DebugLogger.D3(logname, "Unknown typeIndex: " + columnIndex + " for contactID: " + numValueOf);
                }
                i2++;
                mailSmsContacts = this;
                str2 = str23;
            } else {
                str = str10;
            }
            str10 = str;
            i2++;
            mailSmsContacts = this;
            str2 = str23;
        }
        String str24 = str10;
        if (cursorQuery2 != null) {
            cursorQuery2.close();
        }
        return new OutArgs(strGetContactColumn, strGetContactColumn2, str3, str4, str5, str6, str7, str8, str9, str24, str11, str12, str13, str14, str15, str16, str17, str18, str19, str20, str21, str22);
    }

    public OutArgs getContactDetailsCached(int i) {
        String strGetContactColumn;
        boolean zCheckPermission = checkPermission();
        String strGetContactColumn2 = Config.def_additional_assets;
        if (!zCheckPermission) {
            return new OutArgs(Config.def_additional_assets, Config.def_additional_assets);
        }
        Integer numValueOf = Integer.valueOf(i);
        Cursor cursorQuery = this.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"data3", "data2", "data1"}, "contact_id=? AND mimetype='vnd.android.cursor.item/name'", new String[]{numValueOf.toString()}, null);
        if (cursorQuery == null || cursorQuery.getCount() <= 0) {
            strGetContactColumn = Config.def_additional_assets;
        } else {
            cursorQuery.moveToFirst();
            strGetContactColumn2 = GetContactColumn(cursorQuery, "data3");
            strGetContactColumn = GetContactColumn(cursorQuery, "data2");
            if (strGetContactColumn2.length() == 0) {
                strGetContactColumn2 = GetContactColumn(cursorQuery, "data1");
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        this.mLastContactAdresses = new ArrayList<>();
        Cursor cursorQuery2 = this.mContext.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"data4", "data7", "data9", "data8", "data10", "data2"}, "contact_id=? AND mimetype='vnd.android.cursor.item/postal-address_v2'", new String[]{numValueOf.toString()}, null);
        for (int i2 = 0; cursorQuery2 != null && i2 < cursorQuery2.getCount(); i2++) {
            DebugLogger.D5("ContactPickerResultHandler", "handleActivityResult 6");
            cursorQuery2.moveToPosition(i2);
            int columnIndex = cursorQuery2.getColumnIndex("data2");
            if (columnIndex >= 0) {
                DebugLogger.D5("ContactPickerResultHandler", "handleActivityResult 7");
                int i3 = cursorQuery2.getInt(columnIndex);
                String strGetContactColumn3 = GetContactColumn(cursorQuery2, "data4");
                String strGetContactColumn4 = GetContactColumn(cursorQuery2, "data7");
                String strGetContactColumn5 = GetContactColumn(cursorQuery2, "data9");
                String strGetContactColumn6 = GetContactColumn(cursorQuery2, "data8");
                String strGetContactColumn7 = GetContactColumn(cursorQuery2, "data10");
                if (i3 != 0 && i3 != 1 && i3 != 2 && i3 != 3) {
                    DebugLogger.D3(logname, "Unknown typeIndex: " + columnIndex + ", type: " + i3 + " for contactID: " + numValueOf);
                }
                this.mLastContactAdresses.add(new StructuredAddress(strGetContactColumn7, strGetContactColumn6, strGetContactColumn4, strGetContactColumn3, strGetContactColumn5));
            }
        }
        if (cursorQuery2 != null) {
            cursorQuery2.close();
        }
        return new OutArgs(strGetContactColumn2, strGetContactColumn);
    }

    public OutArgs getCachedContactAddress() {
        String str;
        String str2;
        String str3;
        String str4;
        boolean zCheckPermission = checkPermission();
        String str5 = Config.def_additional_assets;
        if (!zCheckPermission) {
            return new OutArgs(Config.def_additional_assets, Config.def_additional_assets, Config.def_additional_assets, Config.def_additional_assets, Config.def_additional_assets);
        }
        ArrayList<StructuredAddress> arrayList = this.mLastContactAdresses;
        if (arrayList == null || arrayList.size() <= 0) {
            str = Config.def_additional_assets;
            str2 = str;
            str3 = str2;
            str4 = str3;
        } else {
            StructuredAddress structuredAddressRemove = this.mLastContactAdresses.remove(0);
            str5 = structuredAddressRemove.street;
            str2 = structuredAddressRemove.city;
            str3 = structuredAddressRemove.zip;
            str4 = structuredAddressRemove.state;
            str = structuredAddressRemove.country;
        }
        return new OutArgs(str5, str2, str3, str4, str);
    }

    public OutArgs insertContact(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, String str17) {
        if (!checkPermission()) {
            return new OutArgs(0L);
        }
        if (Config.enableInsertContactWithNewApi && Build.VERSION.SDK_INT > 10) {
            ArrayList<ContentValues> arrayList = new ArrayList<>();
            ContentValues contentValues = new ContentValues();
            contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredName.CONTENT_ITEM_TYPE);
            contentValues.put("data3", str);
            contentValues.put("data2", str2);
            arrayList.add(contentValues);
            addContactAddressOverAPI10(arrayList, 1, str3, str4, str5, str6, str7);
            addContactAddressOverAPI10(arrayList, 2, str8, str9, str10, str11, str12);
            addContactAddressOverAPI10(arrayList, 3, str13, str14, str15, str16, str17);
            if (Config.getBool("android", "register_functors", true)) {
                Intent intent = new Intent("android.intent.action.INSERT", ContactsContract.Contacts.CONTENT_URI);
                intent.putParcelableArrayListExtra("data", arrayList);
                this.mContext.startActivity(intent);
            }
            return new OutArgs(0L);
        }
        ContentResolver contentResolver = this.mContext.getContentResolver();
        ContentValues contentValues2 = new ContentValues();
        Uri uri = ContactsContract.RawContacts.CONTENT_URI;
        uri.buildUpon().appendQueryParameter(ContactsHelper.CALLER_IS_SYNCADAPTER, "true").build();
        Uri uriInsert = contentResolver.insert(uri, contentValues2);
        Uri uriWithAppendedPath = Uri.withAppendedPath(uriInsert, "data");
        contentValues2.clear();
        contentValues2.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredName.CONTENT_ITEM_TYPE);
        contentValues2.put("data3", str);
        contentValues2.put("data2", str2);
        contentResolver.insert(uriWithAppendedPath, contentValues2);
        Uri uriWithAppendedPath2 = Uri.withAppendedPath(uriInsert, "data");
        addContactAddressUntilAPI10(uriWithAppendedPath2, 1, str3, str4, str5, str6, str7);
        addContactAddressUntilAPI10(uriWithAppendedPath2, 2, str8, str9, str10, str11, str12);
        addContactAddressUntilAPI10(uriWithAppendedPath2, 3, str13, str14, str15, str16, str17);
        contentValues2.clear();
        contentValues2.put(ContactsHelper.RawContactsColumns.AGGREGATION_MODE, (Integer) 1);
        contentValues2.putNull(ContactsHelper.SyncColumns.SOURCE_ID);
        contentResolver.update(uriInsert, contentValues2, null, null);
        startEditContactIntentForResult(uriInsert);
        return new OutArgs(Long.valueOf(ContentUris.parseId(uriInsert)));
    }

    public void uiShowContact(long j) {
        if (checkPermission()) {
            this.mContext.startActivity(new Intent("android.intent.action.VIEW", ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, j)));
        }
    }

    public void uiShowContacts() {
        if (checkPermission()) {
            IgoActivity igoActivity = Application.getIgoActivity();
            if (igoActivity == null) {
                DebugLogger.D2(logname, "IgoActivity is null in uiShowContacts!");
            } else {
                igoActivity.startActivityForResult(new Intent("android.intent.action.PICK", ContactsContract.Contacts.CONTENT_URI), ContactPickerResultHandler.REQUEST_CODE);
            }
        }
    }

    private String GetContactColumn(Cursor cursor, String str) {
        int columnIndex = cursor.getColumnIndex(str);
        String string = columnIndex >= 0 ? cursor.getString(columnIndex) : Config.def_additional_assets;
        return string == null ? Config.def_additional_assets : string;
    }

    public void addContactAddressOverAPI10(ArrayList<ContentValues> arrayList, int i, String str, String str2, String str3, String str4, String str5) {
        if (str.length() > 0 || str2.length() > 0 || str3.length() > 0 || str4.length() > 0 || str5.length() > 0) {
            ContentValues contentValues = new ContentValues();
            contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredPostal.CONTENT_ITEM_TYPE);
            contentValues.put("data2", Integer.valueOf(i));
            contentValues.put("data4", str);
            contentValues.put("data7", str2);
            contentValues.put("data9", str3);
            contentValues.put("data8", str4);
            contentValues.put("data10", str5);
            arrayList.add(contentValues);
        }
    }

    public void addContactAddressUntilAPI10(Uri uri, int i, String str, String str2, String str3, String str4, String str5) {
        if (str.length() > 0 || str2.length() > 0 || str3.length() > 0 || str4.length() > 0 || str5.length() > 0) {
            ContentValues contentValues = new ContentValues();
            contentValues.put(ContactsHelper.DataColumns.MIMETYPE, ContactsHelper.StructuredPostal.CONTENT_ITEM_TYPE);
            contentValues.put("data2", Integer.valueOf(i));
            contentValues.put("data4", str);
            contentValues.put("data7", str2);
            contentValues.put("data9", str3);
            contentValues.put("data8", str4);
            contentValues.put("data10", str5);
            this.mContext.getContentResolver().insert(uri, contentValues);
        }
    }

    public void deleteRecentlyInserted() {
        if (this.mRecentlyInsertedContact != null) {
            this.mContext.getContentResolver().delete(this.mRecentlyInsertedContact, null, null);
            resetRecentlyInserted();
        }
    }

    public void resetRecentlyInserted() {
        this.mRecentlyInsertedContact = null;
    }
}
