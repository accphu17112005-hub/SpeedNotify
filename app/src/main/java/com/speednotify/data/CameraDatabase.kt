package com.speednotify.data

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

@Database(entities = [Camera::class, TripLocation::class], version = 3, exportSchema = false)
abstract class CameraDatabase : RoomDatabase() {
    abstract fun cameraDao(): CameraDao
    abstract fun tripLocationDao(): TripLocationDao

    companion object {
        private val MIGRATION_2_3 = object : Migration(2, 3) {
            override fun migrate(database: SupportSQLiteDatabase) {
                database.execSQL(
                    "CREATE TABLE IF NOT EXISTS `trip_locations` " +
                        "(`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, " +
                        "`latitude` REAL NOT NULL, `longitude` REAL NOT NULL, " +
                        "`timestamp` INTEGER NOT NULL, `accuracy` REAL NOT NULL)"
                )
                database.execSQL(
                    "CREATE INDEX IF NOT EXISTS `index_trip_locations_timestamp` " +
                        "ON `trip_locations` (`timestamp`)"
                )
            }
        }

        @Volatile private var INSTANCE: CameraDatabase? = null

        fun getDatabase(context: Context): CameraDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    CameraDatabase::class.java,
                    "camera_database"
                ).addMigrations(MIGRATION_2_3).fallbackToDestructiveMigration().build()
                INSTANCE = instance
                instance
            }
        }
    }
}