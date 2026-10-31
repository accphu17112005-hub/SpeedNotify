# ProGuard/R8 rules for SpeedNotify
# Keep application class
-keep class com.speednotify.SpeedNotifyApplication { *; }

# Keep Room entities and DAOs
-keep class com.speednotify.data.** { *; }

# Keep Service and Receivers
-keep class com.speednotify.service.** { *; }
-keep class com.speednotify.receiver.** { *; }

# Keep UI classes
-keep class com.speednotify.ui.** { *; }

# Keep Utils
-keep class com.speednotify.utils.** { *; }

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }

# Keep Parcelable implementations
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Serializable
-keepclassmembers class * implements java.io.Serializable {
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep Room generated classes
-keep class * extends androidx.room.RoomDatabase { *; }

# Keep Google Play Services
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Keep AndroidX
-keep class androidx.** { *; }
-dontwarn androidx.**

# Keep Kotlin coroutines
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# Keep Material components
-keep class com.google.android.material.** { *; }
-dontwarn com.google.android.material.**

# Remove logging in release
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
}