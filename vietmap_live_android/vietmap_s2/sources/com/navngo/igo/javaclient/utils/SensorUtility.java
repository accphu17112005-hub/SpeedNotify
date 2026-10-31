package com.navngo.igo.javaclient.utils;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SensorUtility {
    private static final String logname = "SensorUtility";
    private SensorManager sensorManager = null;
    private boolean accelerometerListener_registered = false;
    private SensorEventListener accelerometerListener = null;
    private boolean compassListener_registered = false;
    private SensorEventListener compassListener = null;

    public synchronized void startSensors() {
        DebugLogger.D3(logname, "startSensors");
        if (this.sensorManager == null) {
            this.sensorManager = (SensorManager) Application.anApplication.getSystemService("sensor");
        }
        if (this.sensorManager != null) {
            if (!this.accelerometerListener_registered) {
                if (this.accelerometerListener == null) {
                    this.accelerometerListener = new AccelerometerListener();
                }
                Sensor defaultSensor = this.sensorManager.getDefaultSensor(1);
                if (defaultSensor != null) {
                    this.sensorManager.registerListener(this.accelerometerListener, defaultSensor, 3);
                    this.accelerometerListener_registered = true;
                }
            }
            if (!this.compassListener_registered) {
                if (this.compassListener == null) {
                    this.compassListener = new CompassListener();
                }
                Sensor defaultSensor2 = this.sensorManager.getDefaultSensor(2);
                if (defaultSensor2 != null) {
                    this.sensorManager.registerListener(this.compassListener, defaultSensor2, 3);
                    this.compassListener_registered = true;
                }
            }
        } else {
            DebugLogger.D3(logname, "startSensors: no SENSOR_SERVICE");
        }
    }

    public synchronized void stopSensors() {
        DebugLogger.D3(logname, "stopSensors");
        if (this.accelerometerListener_registered) {
            this.accelerometerListener_registered = false;
            this.sensorManager.unregisterListener(this.accelerometerListener);
        }
        if (this.compassListener_registered) {
            this.compassListener_registered = false;
            this.sensorManager.unregisterListener(this.compassListener);
        }
        this.sensorManager = null;
    }

    final class AccelerometerListener implements SensorEventListener {
        static final String logname = "SensorUtility.AccelerometerListener";

        AccelerometerListener() {
        }

        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i) {
            DebugLogger.D5(logname, "onAccuracyChanged: sensor(" + sensor + ") accuracy (" + i + ")");
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            DebugLogger.D5(logname, "onSensorChanged: X: " + sensorEvent.values[0] + " Y: " + sensorEvent.values[1] + " Z: " + sensorEvent.values[2]);
        }
    }

    final class CompassListener implements SensorEventListener {
        static final String logname = "SensorUtility.CompassListener";

        CompassListener() {
        }

        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i) {
            DebugLogger.D5(logname, "onAccuracyChanged: sensor(" + sensor + ") accuracy (" + i + ")");
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            DebugLogger.D5(logname, "onSensorChanged: X: " + sensorEvent.values[0] + " Y: " + sensorEvent.values[1] + " Z: " + sensorEvent.values[2]);
        }
    }
}
