package com.navngo.igo.contactshelper;

import android.net.Uri;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ContactsHelper {
    static final Uri AUTHORITY_URI;
    public static final String CALLER_IS_SYNCADAPTER = "caller_is_syncadapter";
    static final Uri DATA_CONTENT_URI;
    static final Uri POSTAL_CONTENT_URI;

    public interface BaseTypes {
        public static final int TYPE_CUSTOM = 0;
    }

    private interface CommonColumns extends BaseTypes {
        public static final String DATA = "data1";
        public static final String LABEL = "data3";
        public static final String TYPE = "data2";
    }

    public static final class Contacts {
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/contact";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/contact";
        public static final Uri CONTENT_URI = Uri.withAppendedPath(ContactsHelper.AUTHORITY_URI, "contacts");
        public static final String CUSTOM_RINGTONE = "custom_ringtone";
        public static final String DISPLAY_NAME = "display_name";
        public static final String HAS_PHONE_NUMBER = "has_phone_number";
        public static final String IN_VISIBLE_GROUP = "in_visible_group";
        public static final String LAST_TIME_CONTACTED = "last_time_contacted";
        public static final String LOOKUP_KEY = "lookup";
        public static final String PHOTO_ID = "photo_id";
        public static final String PRESENCE_CUSTOM_PROTOCOL = "presence_custom_protocol";
        public static final String PRESENCE_PROTOCOL = "presence_protocol";
        public static final String SEND_TO_VOICEMAIL = "send_to_voicemail";
        public static final String STARRED = "starred";
        public static final String TIMES_CONTACTED = "times_contacted";
    }

    private interface DataColumns {
        public static final String DATA1 = "data1";
        public static final String DATA10 = "data10";
        public static final String DATA11 = "data11";
        public static final String DATA12 = "data12";
        public static final String DATA13 = "data13";
        public static final String DATA14 = "data14";
        public static final String DATA15 = "data15";
        public static final String DATA2 = "data2";
        public static final String DATA3 = "data3";
        public static final String DATA4 = "data4";
        public static final String DATA5 = "data5";
        public static final String DATA6 = "data6";
        public static final String DATA7 = "data7";
        public static final String DATA8 = "data8";
        public static final String DATA9 = "data9";
        public static final String DATA_VERSION = "data_version";
        public static final String IS_PRIMARY = "is_primary";
        public static final String IS_SUPER_PRIMARY = "is_super_primary";
        public static final String MIMETYPE = "mimetype";
        public static final String RAW_CONTACT_ID = "raw_contact_id";
        public static final String RES_PACKAGE = "res_package";
        public static final String SYNC1 = "data_sync1";
        public static final String SYNC2 = "data_sync2";
        public static final String SYNC3 = "data_sync3";
        public static final String SYNC4 = "data_sync4";
    }

    private interface RawContactsColumns {
        public static final String AGGREGATION_MODE = "aggregation_mode";
        public static final String CONTACT_ID = "contact_id";
        public static final String DELETED = "deleted";
        public static final String IS_RESTRICTED = "is_restricted";
    }

    private interface SyncColumns {
        public static final String ACCOUNT_NAME = "account_name";
        public static final String ACCOUNT_TYPE = "account_type";
        public static final String DIRTY = "dirty";
        public static final String SOURCE_ID = "sourceid";
        public static final String VERSION = "version";
    }

    static {
        Uri uri = Uri.parse("content://com.android.contacts");
        AUTHORITY_URI = uri;
        Uri uriWithAppendedPath = Uri.withAppendedPath(uri, "data");
        DATA_CONTENT_URI = uriWithAppendedPath;
        POSTAL_CONTENT_URI = Uri.withAppendedPath(uriWithAppendedPath, "postals");
    }

    public static final class RawContacts implements SyncColumns, RawContactsColumns {
        public static final int AGGREGATION_MODE_DEFAULT = 0;
        public static final int AGGREGATION_MODE_DISABLED = 3;
        public static final int AGGREGATION_MODE_IMMEDIATE = 1;
        public static final int AGGREGATION_MODE_SUSPENDED = 2;
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/raw_contact";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/raw_contact";
        public static final Uri CONTENT_URI = Uri.withAppendedPath(ContactsHelper.AUTHORITY_URI, "raw_contacts");

        private RawContacts() {
        }

        public static final class Data implements DataColumns {
            public static final String CONTENT_DIRECTORY = "data";

            private Data() {
            }
        }
    }

    public static final class StructuredPostal implements CommonColumns, DataColumns {
        public static final String CITY = "data7";
        public static final String CONTENT_DIRECTORY = "data";
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/postal-address_v2";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/postal-address_v2";
        public static final Uri CONTENT_URI = Uri.withAppendedPath(ContactsHelper.DATA_CONTENT_URI, "postals");
        public static final String COUNTRY = "data10";
        public static final String FORMATTED_ADDRESS = "data1";
        public static final String NEIGHBORHOOD = "data6";
        public static final String POBOX = "data5";
        public static final String POSTCODE = "data9";
        public static final String REGION = "data8";
        public static final String STREET = "data4";
        public static final int TYPE_HOME = 1;
        public static final int TYPE_OTHER = 3;
        public static final int TYPE_WORK = 2;

        private StructuredPostal() {
        }
    }

    public static final class StructuredName implements CommonColumns, DataColumns {
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/name";
        public static final String DISPLAY_NAME = "data1";
        public static final String FAMILY_NAME = "data3";
        public static final String GIVEN_NAME = "data2";
        public static final String MIDDLE_NAME = "data5";
        public static final String PHONETIC_FAMILY_NAME = "data9";
        public static final String PHONETIC_GIVEN_NAME = "data7";
        public static final String PHONETIC_MIDDLE_NAME = "data8";
        public static final String PREFIX = "data4";
        public static final String SUFFIX = "data6";

        private StructuredName() {
        }
    }

    public static final class Phone implements DataColumns, CommonColumns {
        public static final Uri CONTENT_FILTER_URI;
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/phone_v2";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/phone_v2";
        public static final Uri CONTENT_URI;
        public static final String NUMBER = "data1";
        public static final int TYPE_ASSISTANT = 19;
        public static final int TYPE_CALLBACK = 8;
        public static final int TYPE_CAR = 9;
        public static final int TYPE_COMPANY_MAIN = 10;
        public static final int TYPE_FAX_HOME = 5;
        public static final int TYPE_FAX_WORK = 4;
        public static final int TYPE_HOME = 1;
        public static final int TYPE_ISDN = 11;
        public static final int TYPE_MAIN = 12;
        public static final int TYPE_MMS = 20;
        public static final int TYPE_MOBILE = 2;
        public static final int TYPE_OTHER = 7;
        public static final int TYPE_OTHER_FAX = 13;
        public static final int TYPE_PAGER = 6;
        public static final int TYPE_RADIO = 14;
        public static final int TYPE_TELEX = 15;
        public static final int TYPE_TTY_TDD = 16;
        public static final int TYPE_WORK = 3;
        public static final int TYPE_WORK_MOBILE = 17;
        public static final int TYPE_WORK_PAGER = 18;

        private Phone() {
        }

        static {
            Uri uriWithAppendedPath = Uri.withAppendedPath(ContactsHelper.DATA_CONTENT_URI, "phones");
            CONTENT_URI = uriWithAppendedPath;
            CONTENT_FILTER_URI = Uri.withAppendedPath(uriWithAppendedPath, "filter");
        }
    }

    public static final class Note implements DataColumns {
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/note";
        public static final String NOTE = "data1";

        private Note() {
        }
    }

    public static final class GCoor implements DataColumns {
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/motonav_gcoor";
        public static final String COOR_LATITUDE = "data1";
        public static final String COOR_LONGITUDE = "data2";

        private GCoor() {
        }
    }
}
