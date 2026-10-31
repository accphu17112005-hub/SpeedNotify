package com.vietmap.dashcam.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

@Database(entities = [SpeedCameraEntity::class], version = 3, exportSchema = false)
abstract class AppDatabase : RoomDatabase() {
    abstract fun cameraDao(): CameraDao

    companion object {
        @Volatile
        private var INSTANCE: AppDatabase? = null

        /**
         * Migration v1 → v2:
         * Thêm cột osm_id (INTEGER DEFAULT 0) và unique index để hỗ trợ
         * upsert dữ liệu camera từ OpenStreetMap mà không bị trùng lặp.
         */
        private val MIGRATION_1_2 = object : Migration(1, 2) {
            override fun migrate(db: SupportSQLiteDatabase) {
                // osm_id là nullable INTEGER — NULL cho dữ liệu thủ công
                // SQLite UNIQUE index coi mỗi NULL là distinct → không conflict
                db.execSQL("ALTER TABLE speed_cameras ADD COLUMN osm_id INTEGER")
                // Standard unique index — Room schema validation sẽ pass
                db.execSQL(
                    "CREATE UNIQUE INDEX IF NOT EXISTS idx_osm_id ON speed_cameras (osm_id)"
                )
            }
        }

        /**
         * Migration v2 → v3:
         * Fix lỗi schema mismatch: migration v1→v2 tạo cột osm_id với
         * NOT NULL DEFAULT 0, nhưng entity khai báo Long? (nullable).
         * SQLite không hỗ trợ ALTER COLUMN nên phải recreate bảng:
         *   1. Đổi tên bảng cũ thành _old
         *   2. Tạo bảng mới với schema đúng (osm_id nullable, không có default)
         *   3. Copy dữ liệu (osm_id=0 → NULL vì đó là dữ liệu thủ công)
         *   4. Drop bảng cũ và tạo lại index
         */
        private val MIGRATION_2_3 = object : Migration(2, 3) {
            override fun migrate(db: SupportSQLiteDatabase) {
                db.execSQL("ALTER TABLE speed_cameras RENAME TO speed_cameras_old")
                db.execSQL("""
                    CREATE TABLE speed_cameras (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        name TEXT NOT NULL,
                        latitude REAL NOT NULL,
                        longitude REAL NOT NULL,
                        speedLimit INTEGER NOT NULL,
                        type TEXT NOT NULL,
                        description TEXT NOT NULL,
                        osm_id INTEGER
                    )
                """.trimIndent())
                // Copy dữ liệu — osm_id=0 (dữ liệu thủ công) chuyển thành NULL
                db.execSQL("""
                    INSERT INTO speed_cameras (id, name, latitude, longitude, speedLimit, type, description, osm_id)
                    SELECT id, name, latitude, longitude, speedLimit, type, description,
                        CASE WHEN osm_id = 0 THEN NULL ELSE osm_id END
                    FROM speed_cameras_old
                """.trimIndent())
                db.execSQL("DROP TABLE speed_cameras_old")
                db.execSQL(
                    "CREATE UNIQUE INDEX IF NOT EXISTS idx_osm_id ON speed_cameras (osm_id)"
                )
            }
        }

        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    "dashcam_offline_database"
                )
                    .addMigrations(MIGRATION_1_2, MIGRATION_2_3)
                    .fallbackToDestructiveMigration() // Safety net nếu miss migration
                    .build()
                INSTANCE = instance
                instance
            }
        }
    }
}

