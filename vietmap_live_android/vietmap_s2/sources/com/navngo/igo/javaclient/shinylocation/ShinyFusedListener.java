package com.navngo.igo.javaclient.shinylocation;

import android.location.Location;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationAvailability;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import java.util.List;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyFusedListener extends LocationCallback implements IShinyListener {
    private FusedLocationProviderClient fusedLocationProviderClient;
    private ShinyLocationUtils utils;

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return "NNG!Fused";
    }

    ShinyFusedListener(ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
        this.fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(shinyLocationUtils.getContext());
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        LocationRequest locationRequestCreate = LocationRequest.create();
        locationRequestCreate.setInterval(1000L);
        locationRequestCreate.setFastestInterval(1000L);
        locationRequestCreate.setPriority(100);
        LocationServices.getSettingsClient(this.utils.getContext()).checkLocationSettings(new LocationSettingsRequest.Builder().addLocationRequest(locationRequestCreate).build()).addOnFailureListener(new OnFailureListener() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda0
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                this.f$0.m16lambda$startListening$0$comnavngoigojavaclientshinylocationShinyFusedListener(exc);
            }
        });
        this.fusedLocationProviderClient.requestLocationUpdates(locationRequestCreate, this, null).addOnSuccessListener(new OnSuccessListener() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda2
            @Override // com.google.android.gms.tasks.OnSuccessListener
            public final void onSuccess(Object obj) {
                this.f$0.m17lambda$startListening$1$comnavngoigojavaclientshinylocationShinyFusedListener((Void) obj);
            }
        }).addOnFailureListener(new OnFailureListener() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda1
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                this.f$0.m18lambda$startListening$2$comnavngoigojavaclientshinylocationShinyFusedListener(exc);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$startListening$0$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener, reason: not valid java name */
    /* synthetic */ void m16lambda$startListening$0$comnavngoigojavaclientshinylocationShinyFusedListener(Exception exc) {
        this.utils.logDebugMessage("Location settings are not good enough for FusedLocation");
    }

    /* JADX INFO: renamed from: lambda$startListening$1$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener, reason: not valid java name */
    /* synthetic */ void m17lambda$startListening$1$comnavngoigojavaclientshinylocationShinyFusedListener(Void r3) {
        this.utils.sendRegisterMessage(getProviderName(), true);
    }

    /* JADX INFO: renamed from: lambda$startListening$2$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener, reason: not valid java name */
    /* synthetic */ void m18lambda$startListening$2$comnavngoigojavaclientshinylocationShinyFusedListener(Exception exc) {
        this.utils.sendRegisterMessage(getProviderName(), exc);
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        this.fusedLocationProviderClient.removeLocationUpdates(this);
        this.utils.sendUnregisterMessage(getProviderName());
    }

    @Override // com.google.android.gms.location.LocationCallback
    public void onLocationAvailability(LocationAvailability locationAvailability) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addBool("isLocationAvailable", locationAvailability.isLocationAvailable());
            this.utils.sendJson("fusedAvailable", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onLocationAvailability", e);
        }
    }

    @Override // com.google.android.gms.location.LocationCallback
    public void onLocationResult(LocationResult locationResult) {
        List<Location> locations = locationResult.getLocations();
        for (int i = 0; i < locations.size(); i++) {
            try {
                ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
                shinyJsonObject.addObject("location", this.utils.locationToJson(locations.get(i)));
                boolean z = true;
                if (i != locations.size() - 1) {
                    z = false;
                }
                shinyJsonObject.addBool("isLast", z);
                this.utils.sendJson("fused", shinyJsonObject);
            } catch (JSONException e) {
                this.utils.handleJsonException("onLocationResult", e);
                return;
            }
        }
    }
}
