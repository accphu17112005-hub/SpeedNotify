package com.speednotify.data

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query

import kotlinx.coroutines.flow.Flow

@Dao
interface TripLocationDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(location: TripLocation)

    @Query("SELECT * FROM trip_locations WHERE timestamp >= :start AND timestamp < :end ORDER BY timestamp")
    suspend fun getLocationsBetween(start: Long, end: Long): List<TripLocation>

    @Query("SELECT * FROM trip_locations WHERE timestamp >= :start AND timestamp < :end ORDER BY timestamp")
    fun observeLocationsBetween(start: Long, end: Long): Flow<List<TripLocation>>
}