package com.navngo.igo.javaclient.shinylocation;

import android.location.GpsSatellite;
import android.location.GpsStatus;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyGpsStatusListenerLegacy implements IShinyListener, GpsStatus.Listener {
    private HashMap<Integer, ShinySatelliteLegacy> prevSatellites = new HashMap<>();
    private ShinyLocationUtils utils;

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return "NNG!GpsStatus";
    }

    ShinyGpsStatusListenerLegacy(ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        try {
            this.utils.sendRegisterMessage(getProviderName(), this.utils.getLocationManager().addGpsStatusListener(this));
        } catch (Throwable th) {
            this.utils.sendRegisterMessage(getProviderName(), th);
        }
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        this.utils.getLocationManager().removeGpsStatusListener(this);
        this.utils.sendUnregisterMessage(getProviderName());
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // android.location.GpsStatus.Listener
    public void onGpsStatusChanged(int i) {
        String str;
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            String str2 = null;
            if (i == 1) {
                str2 = "gpsStart";
            } else if (i != 2) {
                if (i == 3) {
                    str = "gpsFirstFix";
                    shinyJsonObject.addInt("timeToFirstFix", this.utils.getLocationManager().getGpsStatus(null).getTimeToFirstFix());
                } else if (i == 4) {
                    str = "gpsSatellites";
                    Iterable<GpsSatellite> satellites = this.utils.getLocationManager().getGpsStatus(null).getSatellites();
                    HashMap<Integer, ShinySatelliteLegacy> map = new HashMap<>();
                    ArrayList arrayList = new ArrayList();
                    for (GpsSatellite gpsSatellite : satellites) {
                        Integer numValueOf = Integer.valueOf(gpsSatellite.getPrn());
                        ShinySatelliteLegacy shinySatelliteLegacy = new ShinySatelliteLegacy(gpsSatellite);
                        map.put(numValueOf, shinySatelliteLegacy);
                        arrayList.add(shinySatelliteLegacy.getDifference(this.prevSatellites.get(numValueOf)));
                    }
                    if (this.prevSatellites.isEmpty()) {
                        shinyJsonObject.addArray("data", arrayList);
                    } else {
                        shinyJsonObject.addArray("diff", arrayList);
                    }
                    this.prevSatellites = map;
                }
                str2 = str;
            } else {
                str2 = "gpsStop";
            }
            this.utils.sendJson(str2, shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onStatusChanged", e);
        }
    }
}
