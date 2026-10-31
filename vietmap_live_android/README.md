# Vietmap Live Android — Dashcam App

Ứng dụng dashcam tích hợp bản đồ offline và cảnh báo camera phạt nguội cho Android.

## Yêu cầu

- Android Studio Hedgehog trở lên
- Android SDK 26+
- Thiết bị/emulator Android 8.0+

## Cài đặt sau khi clone

### 1. Clone repo

```bash
git clone https://gitlab.com/sondeptrai/vietmap_live_android.git
cd vietmap_live_android
git checkout huydo
```

### 2. Tải file bản đồ offline (bắt buộc)

File `vietnam.mbtiles` **không được lưu trong git** vì quá lớn (~1GB+).
Cần tải về và đặt vào thư mục đúng chỗ trên thiết bị Android.

**Tải file tại:** _(thêm link Google Drive / OneDrive của bạn vào đây)_

**Đặt file vào thiết bị Android:**
```
/sdcard/Android/data/com.vietmap.dashcam/files/vietnam.mbtiles
```

Hoặc dùng adb:
```bash
adb push vietnam.mbtiles /sdcard/Android/data/com.vietmap.dashcam/files/
```

> Nếu thiếu file này, app vẫn chạy được nhưng bản đồ sẽ không hiển thị.

### 3. Build & chạy

Mở project bằng Android Studio → **Build → Make Project** → **Run**

Các file trong `app/build/` và `.gradle/` sẽ được Android Studio tự động tạo.

---

## Cấu trúc project

```
app/
  src/main/java/com/vietmap/dashcam/
    MainActivity.kt          # Activity chính — bản đồ + HUD tốc độ
    service/WarningService.kt # Service GPS + cảnh báo tốc độ
    database/                 # Room database — danh sách camera
    tts/VoiceAlertManager.kt  # Text-to-speech tiếng Việt
    data/OsmCameraRepository.kt # Tự động fetch camera từ OpenStreetMap
    map/CameraMarkerHelper.kt # Marker camera trên bản đồ
vietmap_s2/                  # Nguồn tham khảo Vietmap SDK
```

## Tính năng

- 🗺️ Bản đồ offline (MapLibre + MBTiles)
- 📷 Kết nối dashcam qua WiFi
- 🚨 Cảnh báo camera phạt nguội bằng giọng nói (offline)
- ⚠️ Cảnh báo biển đổi tốc độ
- 🛰️ Theo dõi tốc độ GPS thời gian thực
- 🔄 Tự động cập nhật dữ liệu camera từ OpenStreetMap
