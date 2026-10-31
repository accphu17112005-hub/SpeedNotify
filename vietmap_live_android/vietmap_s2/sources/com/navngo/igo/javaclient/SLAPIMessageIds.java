package com.navngo.igo.javaclient;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class SLAPIMessageIds {
    static final int ASR_CLIENT_ID = 777;
    static final int HWND_BROADCAST = -1330787753;
    static final int SLAPI_ADDFAVORITEADDRESS = 201;
    static final int SLAPI_ADDFAVORITEPOS = 202;
    public static final int SLAPI_CLIENT_BYE = 3;
    public static final int SLAPI_CLIENT_HELLO = 1;
    static final int SLAPI_COPYDATA = 200;
    static final int SLAPI_DELETEMARKER = 100;
    static final int SLAPI_DELETEROUTE = 101;
    static final int SLAPI_EXIT = 102;
    static final int SLAPI_GETADDRESS = 103;
    public static final int SLAPI_GETADDRESSFROMPOS = 104;
    static final int SLAPI_GETCURSORADDRESS = 105;
    static final int SLAPI_GETCURSORPOS = 106;
    static final int SLAPI_GETDAYNIGHTMODE = 123;
    static final int SLAPI_GETGPSSTATUS = 107;
    static final int SLAPI_GETGPSTIME = 108;
    static final int SLAPI_GETLANGUAGE = 109;
    public static final int SLAPI_GETPOSFROMADDRESS = 203;
    static final int SLAPI_GETPOSITION = 110;
    static final int SLAPI_GETROUTEGUIDANCEDATA = 111;
    public static final int SLAPI_GETROUTEINFO = 112;
    static final int SLAPI_GETSPEEDANDDIRECTION = 113;
    static final int SLAPI_GETVERSION = 114;
    static final int SLAPI_LOADKMLROUTE = 204;
    static final int SLAPI_OUT_ADDRESS = 315;
    static final int SLAPI_OUT_ADDRESSFROMPOS = 314;
    static final int SLAPI_OUT_ARRIVEDTODESTINATION = 300;
    static final int SLAPI_OUT_ARRIVEDTOWAYPOINT = 301;
    static final int SLAPI_OUT_CURSORADDRESS = 316;
    static final int SLAPI_OUT_CURSORPOS = 317;
    static final int SLAPI_OUT_DAYNIGHTMODECHANGED = 327;
    static final int SLAPI_OUT_DESTINATIONSET = 302;
    public static final int SLAPI_OUT_ERROR = 318;
    static final int SLAPI_OUT_GPSSTATUS = 319;
    static final int SLAPI_OUT_GPSTIME = 320;
    static final int SLAPI_OUT_KMLROUTELOADED = 303;
    static final int SLAPI_OUT_LANGUAGE = 305;
    static final int SLAPI_OUT_LANGUAGESET = 304;
    static final int SLAPI_OUT_MESSAGE_BOX_PRESSED = 326;
    static final int SLAPI_OUT_PLANMODESET = 306;
    static final int SLAPI_OUT_POSFROMADDRESS = 307;
    static final int SLAPI_OUT_POSITION = 308;
    static final int SLAPI_OUT_ROUTEGUIDANCEDATA = 321;
    static final int SLAPI_OUT_ROUTEINFO = 322;
    static final int SLAPI_OUT_SPEEDANDDIRECTION = 309;
    static final int SLAPI_OUT_STARTSET = 310;
    static final int SLAPI_OUT_TRUCKPROFILESETUPDONE = 311;
    static final int SLAPI_OUT_UX_CALLBACK = 323;
    static final int SLAPI_OUT_UX_RESULT = 324;
    static final int SLAPI_OUT_VEHICLESET = 312;
    static final int SLAPI_OUT_VERSION = 325;
    static final int SLAPI_OUT_WAYPOINTSET = 313;
    static final int SLAPI_RESETSETTINGS = 122;
    public static final int SLAPI_SERVER_BYE = 4;
    public static final int SLAPI_SERVER_HELLO = 2;
    static final int SLAPI_SETDAYNIGHTMODE = 121;
    public static final int SLAPI_SETDESTINATIONADDRESS = 205;
    public static final int SLAPI_SETDESTINATIONPOS = 206;
    static final int SLAPI_SETLANGUAGE = 115;
    static final int SLAPI_SETMARKER = 207;
    public static final int SLAPI_SETPLANMODE = 116;
    static final int SLAPI_SETSOUND = 117;
    static final int SLAPI_SETSTARTADDRESS = 208;
    static final int SLAPI_SETSTARTPOS = 118;
    static final int SLAPI_SETTRUCKSETTING = 209;
    static final int SLAPI_SETUPTRUCKPROFILE = 210;
    static final int SLAPI_SETVEHICLE = 119;
    static final int SLAPI_SETWAYPOINTADDRESS = 211;
    public static final int SLAPI_SETWAYPOINTPOS = 212;
    static final int SLAPI_SHOWHMI = 120;
    static final int SLAPI_SHOWPOS = 213;
    static final int SLAPI_SHOW_MESSAGE_BOX = 220;
    public static final int SLAPI_UX_EVAL = 221;
    static final int SLAPI_UX_GETVAR = 214;
    static final int SLAPI_UX_INIT = 215;
    static final int SLAPI_UX_LIST_SPLICE = 216;
    public static final int SLAPI_UX_REGISTER_CALLBACK = 217;
    static final int SLAPI_UX_RUN = 218;
    static final int SLAPI_UX_SETVAR = 219;
    static final String name = "com.navngo.igo.javaclient.SLAPI_SERVER";

    public static String MessageName(int i) {
        if (i == 1) {
            return "WM_SLAPI_CLIENT_HELLO";
        }
        if (i == 2) {
            return "WM_SLAPI_SERVER_HELLO";
        }
        if (i == 3) {
            return "WM_SLAPI_CLIENT_BYE";
        }
        if (i == 4) {
            return "WM_SLAPI_SERVER_BYE";
        }
        if (i == 221) {
            return "WM_SLAPI_UX_EVAL";
        }
        if (i == SLAPI_OUT_DAYNIGHTMODECHANGED) {
            return "WM_SLAPI_OUT_DAYNIGHTMODECHANGED";
        }
        switch (i) {
            case 100:
                return "WM_SLAPI_DELETEMARKER";
            case 101:
                return "WM_SLAPI_DELETEROUTE";
            case 102:
                return "WM_SLAPI_EXIT";
            case 103:
                return "WM_SLAPI_GETADDRESS";
            case 104:
                return "WM_SLAPI_GETADDRESSFROMPOS";
            case 105:
                return "WM_SLAPI_GETCURSORADDRESS";
            case 106:
                return "WM_SLAPI_GETCURSORPOS";
            case 107:
                return "WM_SLAPI_GETGPSSTATUS";
            case 108:
                return "WM_SLAPI_GETGPSTIME";
            case 109:
                return "WM_SLAPI_GETLANGUAGE";
            case 110:
                return "WM_SLAPI_GETPOSITION";
            case 111:
                return "WM_SLAPI_GETROUTEGUIDANCEDATA";
            case 112:
                return "WM_SLAPI_GETROUTEINFO";
            case 113:
                return "WM_SLAPI_GETSPEEDANDDIRECTION";
            case 114:
                return "WM_SLAPI_GETVERSION";
            case 115:
                return "WM_SLAPI_SETLANGUAGE";
            case 116:
                return "WM_SLAPI_SETPLANMODE";
            case 117:
                return "WM_SLAPI_SETSOUND";
            case 118:
                return "WM_SLAPI_SETSTARTPOS";
            case 119:
                return "WM_SLAPI_SETVEHICLE";
            case 120:
                return "WM_SLAPI_SHOWHMI";
            case 121:
                return "WM_SLAPI_SETDAYNIGHTMODE";
            case 122:
                return "WM_SLAPI_RESETSETTINGS";
            case 123:
                return "WM_SLAPI_GETDAYNIGHTMODE";
            default:
                switch (i) {
                    case 200:
                        return "WM_COPYDATA";
                    case SLAPI_ADDFAVORITEADDRESS /* 201 */:
                        return "WM_SLAPI_ADDFAVORITEADDRESS";
                    case SLAPI_ADDFAVORITEPOS /* 202 */:
                        return "WM_SLAPI_ADDFAVORITEPOS";
                    case SLAPI_GETPOSFROMADDRESS /* 203 */:
                        return "WM_SLAPI_GETPOSFROMADDRESS";
                    case SLAPI_LOADKMLROUTE /* 204 */:
                        return "WM_SLAPI_LOADKMLROUTE";
                    case SLAPI_SETDESTINATIONADDRESS /* 205 */:
                        return "WM_SLAPI_SETDESTINATIONADDRESS";
                    case SLAPI_SETDESTINATIONPOS /* 206 */:
                        return "WM_SLAPI_SETDESTINATIONPOS";
                    case SLAPI_SETMARKER /* 207 */:
                        return "WM_SLAPI_SETMARKER";
                    case SLAPI_SETSTARTADDRESS /* 208 */:
                        return "WM_SLAPI_SETSTARTADDRESS";
                    case SLAPI_SETTRUCKSETTING /* 209 */:
                        return "WM_SLAPI_SETTRUCKSETTING";
                    case SLAPI_SETUPTRUCKPROFILE /* 210 */:
                        return "WM_SLAPI_SETUPTRUCKPROFILE";
                    case SLAPI_SETWAYPOINTADDRESS /* 211 */:
                        return "WM_SLAPI_SETWAYPOINTADDRESS";
                    case SLAPI_SETWAYPOINTPOS /* 212 */:
                        return "WM_SLAPI_SETWAYPOINTPOS";
                    case SLAPI_SHOWPOS /* 213 */:
                        return "WM_SLAPI_SHOWPOS";
                    case SLAPI_UX_GETVAR /* 214 */:
                        return "WM_SLAPI_UX_GETVAR";
                    case SLAPI_UX_INIT /* 215 */:
                        return "WM_SLAPI_UX_INIT";
                    case SLAPI_UX_LIST_SPLICE /* 216 */:
                        return "WM_SLAPI_UX_LIST_SPLICE";
                    case SLAPI_UX_REGISTER_CALLBACK /* 217 */:
                        return "WM_SLAPI_UX_REGISTER_CALLBACK";
                    case SLAPI_UX_RUN /* 218 */:
                        return "WM_SLAPI_UX_RUN";
                    case SLAPI_UX_SETVAR /* 219 */:
                        return "WM_SLAPI_UX_SETVAR";
                    default:
                        switch (i) {
                            case 300:
                                return "WM_SLAPI_OUT_ARRIVEDTODESTINATION";
                            case SLAPI_OUT_ARRIVEDTOWAYPOINT /* 301 */:
                                return "WM_SLAPI_OUT_ARRIVEDTOWAYPOINT";
                            case SLAPI_OUT_DESTINATIONSET /* 302 */:
                                return "WM_SLAPI_OUT_DESTINATIONSET";
                            case SLAPI_OUT_KMLROUTELOADED /* 303 */:
                                return "WM_SLAPI_OUT_KMLROUTELOADED";
                            case SLAPI_OUT_LANGUAGESET /* 304 */:
                                return "WM_SLAPI_OUT_LANGUAGESET";
                            case SLAPI_OUT_LANGUAGE /* 305 */:
                                return "WM_SLAPI_OUT_LANGUAGE";
                            case SLAPI_OUT_PLANMODESET /* 306 */:
                                return "WM_SLAPI_OUT_PLANMODESET";
                            case SLAPI_OUT_POSFROMADDRESS /* 307 */:
                                return "WM_SLAPI_OUT_POSFROMADDRESS";
                            case SLAPI_OUT_POSITION /* 308 */:
                                return "WM_SLAPI_OUT_POSITION";
                            case SLAPI_OUT_SPEEDANDDIRECTION /* 309 */:
                                return "WM_SLAPI_OUT_SPEEDANDDIRECTION";
                            case SLAPI_OUT_STARTSET /* 310 */:
                                return "WM_SLAPI_OUT_STARTSET";
                            case SLAPI_OUT_TRUCKPROFILESETUPDONE /* 311 */:
                                return "WM_SLAPI_OUT_TRUCKPROFILESETUPDONE";
                            case SLAPI_OUT_VEHICLESET /* 312 */:
                                return "WM_SLAPI_OUT_VEHICLESET";
                            case SLAPI_OUT_WAYPOINTSET /* 313 */:
                                return "WM_SLAPI_OUT_WAYPOINTSET";
                            case SLAPI_OUT_ADDRESSFROMPOS /* 314 */:
                                return "WM_SLAPI_OUT_ADDRESSFROMPOS";
                            case SLAPI_OUT_ADDRESS /* 315 */:
                                return "WM_SLAPI_OUT_ADDRESS";
                            case SLAPI_OUT_CURSORADDRESS /* 316 */:
                                return "WM_SLAPI_OUT_CURSORADDRESS";
                            case SLAPI_OUT_CURSORPOS /* 317 */:
                                return "WM_SLAPI_OUT_CURSORPOS";
                            case SLAPI_OUT_ERROR /* 318 */:
                                return "WM_SLAPI_OUT_ERROR";
                            case SLAPI_OUT_GPSSTATUS /* 319 */:
                                return "WM_SLAPI_OUT_GPSSTATUS";
                            case SLAPI_OUT_GPSTIME /* 320 */:
                                return "WM_SLAPI_OUT_GPSTIME";
                            case SLAPI_OUT_ROUTEGUIDANCEDATA /* 321 */:
                                return "WM_SLAPI_OUT_ROUTEGUIDANCEDATA";
                            case SLAPI_OUT_ROUTEINFO /* 322 */:
                                return "WM_SLAPI_OUT_ROUTEINFO";
                            case SLAPI_OUT_UX_CALLBACK /* 323 */:
                                return "WM_SLAPI_OUT_UX_CALLBACK";
                            case SLAPI_OUT_UX_RESULT /* 324 */:
                                return "WM_SLAPI_OUT_UX_RESULT";
                            case SLAPI_OUT_VERSION /* 325 */:
                                return "WM_SLAPI_OUT_VERSION";
                            default:
                                return "Unknown message(" + i + ")";
                        }
                }
        }
    }
}
