###### Class com.navngo.igo.javaclient.SLAPIMessageIds (com.navngo.igo.javaclient.SLAPIMessageIds)
.class public final Lcom/navngo/igo/javaclient/SLAPIMessageIds;
.super Ljava/lang/Object;
.source "SLAPIMessageIds.java"


# static fields
.field static final ASR_CLIENT_ID:I = 0x309

.field static final HWND_BROADCAST:I = -0x4f5235a9

.field static final SLAPI_ADDFAVORITEADDRESS:I = 0xc9

.field static final SLAPI_ADDFAVORITEPOS:I = 0xca

.field public static final SLAPI_CLIENT_BYE:I = 0x3

.field public static final SLAPI_CLIENT_HELLO:I = 0x1

.field static final SLAPI_COPYDATA:I = 0xc8

.field static final SLAPI_DELETEMARKER:I = 0x64

.field static final SLAPI_DELETEROUTE:I = 0x65

.field static final SLAPI_EXIT:I = 0x66

.field static final SLAPI_GETADDRESS:I = 0x67

.field public static final SLAPI_GETADDRESSFROMPOS:I = 0x68

.field static final SLAPI_GETCURSORADDRESS:I = 0x69

.field static final SLAPI_GETCURSORPOS:I = 0x6a

.field static final SLAPI_GETDAYNIGHTMODE:I = 0x7b

.field static final SLAPI_GETGPSSTATUS:I = 0x6b

.field static final SLAPI_GETGPSTIME:I = 0x6c

.field static final SLAPI_GETLANGUAGE:I = 0x6d

.field public static final SLAPI_GETPOSFROMADDRESS:I = 0xcb

.field static final SLAPI_GETPOSITION:I = 0x6e

.field static final SLAPI_GETROUTEGUIDANCEDATA:I = 0x6f

.field public static final SLAPI_GETROUTEINFO:I = 0x70

.field static final SLAPI_GETSPEEDANDDIRECTION:I = 0x71

.field static final SLAPI_GETVERSION:I = 0x72

.field static final SLAPI_LOADKMLROUTE:I = 0xcc

.field static final SLAPI_OUT_ADDRESS:I = 0x13b

.field static final SLAPI_OUT_ADDRESSFROMPOS:I = 0x13a

.field static final SLAPI_OUT_ARRIVEDTODESTINATION:I = 0x12c

.field static final SLAPI_OUT_ARRIVEDTOWAYPOINT:I = 0x12d

.field static final SLAPI_OUT_CURSORADDRESS:I = 0x13c

.field static final SLAPI_OUT_CURSORPOS:I = 0x13d

.field static final SLAPI_OUT_DAYNIGHTMODECHANGED:I = 0x147

.field static final SLAPI_OUT_DESTINATIONSET:I = 0x12e

.field public static final SLAPI_OUT_ERROR:I = 0x13e

.field static final SLAPI_OUT_GPSSTATUS:I = 0x13f

.field static final SLAPI_OUT_GPSTIME:I = 0x140

.field static final SLAPI_OUT_KMLROUTELOADED:I = 0x12f

.field static final SLAPI_OUT_LANGUAGE:I = 0x131

.field static final SLAPI_OUT_LANGUAGESET:I = 0x130

.field static final SLAPI_OUT_MESSAGE_BOX_PRESSED:I = 0x146

.field static final SLAPI_OUT_PLANMODESET:I = 0x132

.field static final SLAPI_OUT_POSFROMADDRESS:I = 0x133

.field static final SLAPI_OUT_POSITION:I = 0x134

.field static final SLAPI_OUT_ROUTEGUIDANCEDATA:I = 0x141

.field static final SLAPI_OUT_ROUTEINFO:I = 0x142

.field static final SLAPI_OUT_SPEEDANDDIRECTION:I = 0x135

.field static final SLAPI_OUT_STARTSET:I = 0x136

.field static final SLAPI_OUT_TRUCKPROFILESETUPDONE:I = 0x137

.field static final SLAPI_OUT_UX_CALLBACK:I = 0x143

.field static final SLAPI_OUT_UX_RESULT:I = 0x144

.field static final SLAPI_OUT_VEHICLESET:I = 0x138

.field static final SLAPI_OUT_VERSION:I = 0x145

.field static final SLAPI_OUT_WAYPOINTSET:I = 0x139

.field static final SLAPI_RESETSETTINGS:I = 0x7a

.field public static final SLAPI_SERVER_BYE:I = 0x4

.field public static final SLAPI_SERVER_HELLO:I = 0x2

.field static final SLAPI_SETDAYNIGHTMODE:I = 0x79

.field public static final SLAPI_SETDESTINATIONADDRESS:I = 0xcd

.field public static final SLAPI_SETDESTINATIONPOS:I = 0xce

.field static final SLAPI_SETLANGUAGE:I = 0x73

.field static final SLAPI_SETMARKER:I = 0xcf

.field public static final SLAPI_SETPLANMODE:I = 0x74

.field static final SLAPI_SETSOUND:I = 0x75

.field static final SLAPI_SETSTARTADDRESS:I = 0xd0

.field static final SLAPI_SETSTARTPOS:I = 0x76

.field static final SLAPI_SETTRUCKSETTING:I = 0xd1

.field static final SLAPI_SETUPTRUCKPROFILE:I = 0xd2

.field static final SLAPI_SETVEHICLE:I = 0x77

.field static final SLAPI_SETWAYPOINTADDRESS:I = 0xd3

.field public static final SLAPI_SETWAYPOINTPOS:I = 0xd4

.field static final SLAPI_SHOWHMI:I = 0x78

.field static final SLAPI_SHOWPOS:I = 0xd5

.field static final SLAPI_SHOW_MESSAGE_BOX:I = 0xdc

.field public static final SLAPI_UX_EVAL:I = 0xdd

.field static final SLAPI_UX_GETVAR:I = 0xd6

.field static final SLAPI_UX_INIT:I = 0xd7

.field static final SLAPI_UX_LIST_SPLICE:I = 0xd8

.field public static final SLAPI_UX_REGISTER_CALLBACK:I = 0xd9

.field static final SLAPI_UX_RUN:I = 0xda

.field static final SLAPI_UX_SETVAR:I = 0xdb

.field static final name:Ljava/lang/String; = "com.navngo.igo.javaclient.SLAPI_SERVER"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static MessageName(I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_115

    const/4 v0, 0x2

    if-eq p0, v0, :cond_112

    const/4 v0, 0x3

    if-eq p0, v0, :cond_10f

    const/4 v0, 0x4

    if-eq p0, v0, :cond_10c

    const/16 v0, 0xdd

    if-eq p0, v0, :cond_109

    const/16 v0, 0x147

    if-eq p0, v0, :cond_106

    packed-switch p0, :pswitch_data_118

    packed-switch p0, :pswitch_data_14c

    packed-switch p0, :pswitch_data_178

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown message("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_34
    const-string p0, "WM_SLAPI_OUT_VERSION"

    return-object p0

    :pswitch_37
    const-string p0, "WM_SLAPI_OUT_UX_RESULT"

    return-object p0

    :pswitch_3a
    const-string p0, "WM_SLAPI_OUT_UX_CALLBACK"

    return-object p0

    :pswitch_3d
    const-string p0, "WM_SLAPI_OUT_ROUTEINFO"

    return-object p0

    :pswitch_40
    const-string p0, "WM_SLAPI_OUT_ROUTEGUIDANCEDATA"

    return-object p0

    :pswitch_43
    const-string p0, "WM_SLAPI_OUT_GPSTIME"

    return-object p0

    :pswitch_46
    const-string p0, "WM_SLAPI_OUT_GPSSTATUS"

    return-object p0

    :pswitch_49
    const-string p0, "WM_SLAPI_OUT_ERROR"

    return-object p0

    :pswitch_4c
    const-string p0, "WM_SLAPI_OUT_CURSORPOS"

    return-object p0

    :pswitch_4f
    const-string p0, "WM_SLAPI_OUT_CURSORADDRESS"

    return-object p0

    :pswitch_52
    const-string p0, "WM_SLAPI_OUT_ADDRESS"

    return-object p0

    :pswitch_55
    const-string p0, "WM_SLAPI_OUT_ADDRESSFROMPOS"

    return-object p0

    :pswitch_58
    const-string p0, "WM_SLAPI_OUT_WAYPOINTSET"

    return-object p0

    :pswitch_5b
    const-string p0, "WM_SLAPI_OUT_VEHICLESET"

    return-object p0

    :pswitch_5e
    const-string p0, "WM_SLAPI_OUT_TRUCKPROFILESETUPDONE"

    return-object p0

    :pswitch_61
    const-string p0, "WM_SLAPI_OUT_STARTSET"

    return-object p0

    :pswitch_64
    const-string p0, "WM_SLAPI_OUT_SPEEDANDDIRECTION"

    return-object p0

    :pswitch_67
    const-string p0, "WM_SLAPI_OUT_POSITION"

    return-object p0

    :pswitch_6a
    const-string p0, "WM_SLAPI_OUT_POSFROMADDRESS"

    return-object p0

    :pswitch_6d
    const-string p0, "WM_SLAPI_OUT_PLANMODESET"

    return-object p0

    :pswitch_70
    const-string p0, "WM_SLAPI_OUT_LANGUAGE"

    return-object p0

    :pswitch_73
    const-string p0, "WM_SLAPI_OUT_LANGUAGESET"

    return-object p0

    :pswitch_76
    const-string p0, "WM_SLAPI_OUT_KMLROUTELOADED"

    return-object p0

    :pswitch_79
    const-string p0, "WM_SLAPI_OUT_DESTINATIONSET"

    return-object p0

    :pswitch_7c
    const-string p0, "WM_SLAPI_OUT_ARRIVEDTOWAYPOINT"

    return-object p0

    :pswitch_7f
    const-string p0, "WM_SLAPI_OUT_ARRIVEDTODESTINATION"

    return-object p0

    :pswitch_82
    const-string p0, "WM_SLAPI_UX_SETVAR"

    return-object p0

    :pswitch_85
    const-string p0, "WM_SLAPI_UX_RUN"

    return-object p0

    :pswitch_88
    const-string p0, "WM_SLAPI_UX_REGISTER_CALLBACK"

    return-object p0

    :pswitch_8b
    const-string p0, "WM_SLAPI_UX_LIST_SPLICE"

    return-object p0

    :pswitch_8e
    const-string p0, "WM_SLAPI_UX_INIT"

    return-object p0

    :pswitch_91
    const-string p0, "WM_SLAPI_UX_GETVAR"

    return-object p0

    :pswitch_94
    const-string p0, "WM_SLAPI_SHOWPOS"

    return-object p0

    :pswitch_97
    const-string p0, "WM_SLAPI_SETWAYPOINTPOS"

    return-object p0

    :pswitch_9a
    const-string p0, "WM_SLAPI_SETWAYPOINTADDRESS"

    return-object p0

    :pswitch_9d
    const-string p0, "WM_SLAPI_SETUPTRUCKPROFILE"

    return-object p0

    :pswitch_a0
    const-string p0, "WM_SLAPI_SETTRUCKSETTING"

    return-object p0

    :pswitch_a3
    const-string p0, "WM_SLAPI_SETSTARTADDRESS"

    return-object p0

    :pswitch_a6
    const-string p0, "WM_SLAPI_SETMARKER"

    return-object p0

    :pswitch_a9
    const-string p0, "WM_SLAPI_SETDESTINATIONPOS"

    return-object p0

    :pswitch_ac
    const-string p0, "WM_SLAPI_SETDESTINATIONADDRESS"

    return-object p0

    :pswitch_af
    const-string p0, "WM_SLAPI_LOADKMLROUTE"

    return-object p0

    :pswitch_b2
    const-string p0, "WM_SLAPI_GETPOSFROMADDRESS"

    return-object p0

    :pswitch_b5
    const-string p0, "WM_SLAPI_ADDFAVORITEPOS"

    return-object p0

    :pswitch_b8
    const-string p0, "WM_SLAPI_ADDFAVORITEADDRESS"

    return-object p0

    :pswitch_bb
    const-string p0, "WM_COPYDATA"

    return-object p0

    :pswitch_be
    const-string p0, "WM_SLAPI_GETDAYNIGHTMODE"

    return-object p0

    :pswitch_c1
    const-string p0, "WM_SLAPI_RESETSETTINGS"

    return-object p0

    :pswitch_c4
    const-string p0, "WM_SLAPI_SETDAYNIGHTMODE"

    return-object p0

    :pswitch_c7
    const-string p0, "WM_SLAPI_SHOWHMI"

    return-object p0

    :pswitch_ca
    const-string p0, "WM_SLAPI_SETVEHICLE"

    return-object p0

    :pswitch_cd
    const-string p0, "WM_SLAPI_SETSTARTPOS"

    return-object p0

    :pswitch_d0
    const-string p0, "WM_SLAPI_SETSOUND"

    return-object p0

    :pswitch_d3
    const-string p0, "WM_SLAPI_SETPLANMODE"

    return-object p0

    :pswitch_d6
    const-string p0, "WM_SLAPI_SETLANGUAGE"

    return-object p0

    :pswitch_d9
    const-string p0, "WM_SLAPI_GETVERSION"

    return-object p0

    :pswitch_dc
    const-string p0, "WM_SLAPI_GETSPEEDANDDIRECTION"

    return-object p0

    :pswitch_df
    const-string p0, "WM_SLAPI_GETROUTEINFO"

    return-object p0

    :pswitch_e2
    const-string p0, "WM_SLAPI_GETROUTEGUIDANCEDATA"

    return-object p0

    :pswitch_e5
    const-string p0, "WM_SLAPI_GETPOSITION"

    return-object p0

    :pswitch_e8
    const-string p0, "WM_SLAPI_GETLANGUAGE"

    return-object p0

    :pswitch_eb
    const-string p0, "WM_SLAPI_GETGPSTIME"

    return-object p0

    :pswitch_ee
    const-string p0, "WM_SLAPI_GETGPSSTATUS"

    return-object p0

    :pswitch_f1
    const-string p0, "WM_SLAPI_GETCURSORPOS"

    return-object p0

    :pswitch_f4
    const-string p0, "WM_SLAPI_GETCURSORADDRESS"

    return-object p0

    :pswitch_f7
    const-string p0, "WM_SLAPI_GETADDRESSFROMPOS"

    return-object p0

    :pswitch_fa
    const-string p0, "WM_SLAPI_GETADDRESS"

    return-object p0

    :pswitch_fd
    const-string p0, "WM_SLAPI_EXIT"

    return-object p0

    :pswitch_100
    const-string p0, "WM_SLAPI_DELETEROUTE"

    return-object p0

    :pswitch_103
    const-string p0, "WM_SLAPI_DELETEMARKER"

    return-object p0

    :cond_106
    const-string p0, "WM_SLAPI_OUT_DAYNIGHTMODECHANGED"

    return-object p0

    :cond_109
    const-string p0, "WM_SLAPI_UX_EVAL"

    return-object p0

    :cond_10c
    const-string p0, "WM_SLAPI_SERVER_BYE"

    return-object p0

    :cond_10f
    const-string p0, "WM_SLAPI_CLIENT_BYE"

    return-object p0

    :cond_112
    const-string p0, "WM_SLAPI_SERVER_HELLO"

    return-object p0

    :cond_115
    const-string p0, "WM_SLAPI_CLIENT_HELLO"

    return-object p0

    :pswitch_data_118
    .packed-switch 0x64
        :pswitch_103
        :pswitch_100
        :pswitch_fd
        :pswitch_fa
        :pswitch_f7
        :pswitch_f4
        :pswitch_f1
        :pswitch_ee
        :pswitch_eb
        :pswitch_e8
        :pswitch_e5
        :pswitch_e2
        :pswitch_df
        :pswitch_dc
        :pswitch_d9
        :pswitch_d6
        :pswitch_d3
        :pswitch_d0
        :pswitch_cd
        :pswitch_ca
        :pswitch_c7
        :pswitch_c4
        :pswitch_c1
        :pswitch_be
    .end packed-switch

    :pswitch_data_14c
    .packed-switch 0xc8
        :pswitch_bb
        :pswitch_b8
        :pswitch_b5
        :pswitch_b2
        :pswitch_af
        :pswitch_ac
        :pswitch_a9
        :pswitch_a6
        :pswitch_a3
        :pswitch_a0
        :pswitch_9d
        :pswitch_9a
        :pswitch_97
        :pswitch_94
        :pswitch_91
        :pswitch_8e
        :pswitch_8b
        :pswitch_88
        :pswitch_85
        :pswitch_82
    .end packed-switch

    :pswitch_data_178
    .packed-switch 0x12c
        :pswitch_7f
        :pswitch_7c
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_64
        :pswitch_61
        :pswitch_5e
        :pswitch_5b
        :pswitch_58
        :pswitch_55
        :pswitch_52
        :pswitch_4f
        :pswitch_4c
        :pswitch_49
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
    .end packed-switch
.end method
