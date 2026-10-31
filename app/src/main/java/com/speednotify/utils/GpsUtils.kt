package com.speednotify.utils

import android.location.Location

object GpsUtils {

    private const val MIN_ACCURACY_METERS = 50.0
    private const val MIN_SPEED_KMH = 1.0
    private const val MS_TO_KMH = 3.6f

    /**
     * Chuyển đổi tốc độ từ m/s sang km/h
     */
    fun speedMsToKmh(speedMs: Float): Float {
        return speedMs * MS_TO_KMH
    }

    /**
     * Kiểm tra location có hợp lệ để tính tốc độ không
     */
    fun isValidForSpeedCalculation(location: Location): Boolean {
        return location.hasAccuracy() &&
               location.accuracy <= MIN_ACCURACY_METERS &&
               location.hasSpeed() &&
               speedMsToKmh(location.speed) >= MIN_SPEED_KMH
    }

    /**
     * Lấy tốc độ km/h từ location, trả về -1 nếu không hợp lệ
     */
    fun getValidSpeedKmh(location: Location): Float {
        return if (isValidForSpeedCalculation(location)) {
            speedMsToKmh(location.speed)
        } else {
            -1f
        }
    }

    /**
     * Kiểm tra xem có vượt quá giới hạn tốc độ không
     */
    fun isOverSpeedLimit(currentSpeedKmh: Float, speedLimit: Int, thresholdKmh: Float = 0f): Boolean {
        return currentSpeedKmh > (speedLimit + thresholdKmh)
    }
}