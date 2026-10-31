package com.speednotify.utils

import android.location.Location
import org.junit.Assert.assertTrue
import org.junit.Test

class GpsUtilsTest {
    @Test
    fun getValidSpeedKmh_acceptsTypicalMovingGpsFixes() {
        val location = Location("gps").apply {
            accuracy = 20f
            speed = 13.8889f
            time = 1_000L
        }

        assertTrue(GpsUtils.getValidSpeedKmh(location) > 0f)
    }
}
