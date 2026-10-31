# Fix Build Errors and Code Warnings

This plan addresses the build failure caused by environment variable conflicts, migrates Room to KSP for Kotlin 2.0 compatibility, and fixes critical Lint errors and warnings in the source code.

## User Review Required

> [!IMPORTANT]
> **Environment Variable Conflict:**
> The build is currently failing because both `ANDROID_PREFS_ROOT` and `ANDROID_USER_HOME` environment variables are set. This causes a conflict in the Android Gradle Plugin.
> **Action Required:** Please unset `ANDROID_PREFS_ROOT` in your system environment variables and keep only `ANDROID_USER_HOME`.

> [!NOTE]
> **KSP Migration:**
> I am migrating Room from `kapt` to `KSP`. This is the recommended approach for Kotlin 2.0 and will resolve the "Kapt does not support language version 2.0" warning.

## Proposed Changes

### Build Configuration

#### [MODIFY] [build.gradle.kts](file:///C:/Users/huydo/.gemini/antigravity-ide/scratch/DashcamApp/build.gradle.kts)
- Add KSP plugin declaration.

#### [MODIFY] [app/build.gradle.kts](file:///C:/Users/huydo/.gemini/antigravity-ide/scratch/DashcamApp/app/build.gradle.kts)
- Apply KSP plugin.
- Replace Room `kapt` with `ksp`.

### Source Code Fixes

#### [MODIFY] [MainActivity.kt](file:///C:/Users/huydo/.gemini/antigravity-ide/scratch/DashcamApp/app/src/main/java/com/vietmap/dashcam/MainActivity.kt)
- Fix Broadcast Receiver flag for API 34 compatibility using `ContextCompat.registerReceiver`.
- Clean up string concatenation and hardcoded string warnings.
- Fix unused parameters and coding style issues (trailing commas, parentheses).

#### [MODIFY] [VoiceAlertManager.kt](file:///C:/Users/huydo/.gemini/antigravity-ide/scratch/DashcamApp/app/src/main/java/com/vietmap/dashcam/tts/VoiceAlertManager.kt)
- Remove redundant `val` in constructor.
- Fix string template redundant curly braces.
- Add clarifying parentheses.

#### [MODIFY] [WarningService.kt](file:///C:/Users/huydo/.gemini/antigravity-ide/scratch/DashcamApp/app/src/main/java/com/vietmap/dashcam/service/WarningService.kt)
- Fix coding style issues (trailing commas).

## Verification Plan

### Automated Tests
- Run `./gradlew :app:assembleDebug` (with `ANDROID_PREFS_ROOT` unset) to verify the build.
- Run Lint check: `./gradlew :app:lintDebug`.

### Manual Verification
- Verify that the app starts without crashing due to Receiver errors on API 34+ devices/emulators.
