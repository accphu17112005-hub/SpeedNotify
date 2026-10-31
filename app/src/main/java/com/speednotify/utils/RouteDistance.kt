package com.speednotify.utils

import com.speednotify.data.TripLocation

object RouteDistance {

    fun totalMeters(locations: List<TripLocation>): Double = locations
        .zipWithNext()
        .sumOf { (first, second) ->
            GeoUtils.haversineDistance(
                first.latitude,
                first.longitude,
                second.latitude,
                second.longitude
            )
        }
}