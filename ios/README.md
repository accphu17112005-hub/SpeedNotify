# SpeedNotify — Phiên bản iOS (SwiftUI & Native CoreLocation)

Ứng dụng đo tốc độ GPS, hiển thị biển báo giới hạn tốc độ, cảnh báo camera phạt nguội và điểm bắn tốc độ bằng giọng nói tiếng Việt dành cho **iOS (iPhone / iPad)**.

Dự án được xây dựng hoàn toàn bằng **SwiftUI & Swift hiện đại** (iOS 16.0 trở lên), tương thích đầy đủ tính năng với phiên bản Android của SpeedNotify.

---

## 🌟 Tính năng nổi bật trên iOS

1. **Đồng hồ HUD & Tốc độ GPS thời gian thực:**
   - Vòng đo tốc độ phong cách buồng lái xe thể thao, hỗ trợ đổi màu cảnh báo từ Xanh -> Vàng -> Đỏ khi vi phạm tốc độ.
   - Lọc nhiễu GPS và tính toán tốc độ chính xác từ GPS chipset (`CoreLocation`).

2. **Biển báo tốc độ thông minh (Speed Limit Sign):**
   - Biển báo tròn viền đỏ chuẩn Việt Nam.
   - Tự động tra cứu giới hạn tốc độ của đoạn đường hiện tại (Quốc lộ, Cao tốc, đường đô thị) qua OpenStreetMap Overpass API.

3. **Cảnh báo Camera phạt nguội & Điểm bắn tốc độ:**
   - Dữ liệu có sẵn hơn hàng trăm camera tại Việt Nam (Hà Nội, TP.HCM, các tuyến quốc lộ & cao tốc).
   - Tự động phát hiện camera trong bán kính 750m (camera tốc độ / camera AI) và 350m (camera vượt đèn đỏ).
   - Kiểm tra hướng di chuyển của xe so với góc giám sát của camera để tránh cảnh báo sai chiều.

4. **Giọng đọc tiếng Việt & Audio Ducking:**
   - Sử dụng `AVSpeechSynthesizer` với giọng đọc tiếng Việt (`vi-VN`).
   - Kết hợp âm thanh bíp cảnh báo chuyên dụng (`.wav`).
   - Tự động giảm nhỏ âm lượng nhạc nền (Spotify, Apple Music, YouTube...) khi phát âm thanh cảnh báo và phục hồi khi đọc xong (Audio Ducking).

5. **Hoạt động ngầm khi tắt màn hình (Background Location):**
   - Hỗ trợ đầy đủ `UIBackgroundModes: location, audio`.
   - Ứng dụng tiếp tục đo tốc độ và phát cảnh báo qua loa/tai nghe/Bluetooth xe hơi ngay cả khi bạn khóa màn hình hoặc chuyển sang ứng dụng bản đồ khác (như Google Maps, Apple Maps).

6. **Bản đồ trực quan (Apple Maps / MapKit):**
   - Hiển thị vị trí xe trực tiếp với hướng di chuyển.
   - Marker camera phân loại theo màu: Đỏ (tốc độ), Cam (vượt đèn đỏ), Tím (AI phạt nguội).
   - Chạm vào từng camera để xem chi tiết đoạn đường, giới hạn tốc độ và góc quay.

7. **Ghi lại nhật ký chuyến đi (Trip History):**
   - Tự động tính quãng đường đã đi (km), tốc độ trung bình, tốc độ tối đa và thời gian di chuyển.

8. **Đồng bộ dữ liệu camera mới từ OpenStreetMap:**
   - Tự động tải các điểm bắn tốc độ mới nhất cập nhật bởi cộng đồng OpenStreetMap (Overpass API).

---

## 📁 Cấu trúc thư mục iOS

```
ios/
├── SpeedNotify.xcodeproj/     # Dự án Xcode để mở trực tiếp
│   └── project.pbxproj
├── SpeedNotify/
│   ├── SpeedNotifyApp.swift   # Điểm khởi chạy ứng dụng (@main)
│   ├── Info.plist             # Cấu hình quyền vị trí & Background Modes
│   ├── Models/
│   │   ├── Camera.swift       # Model dữ liệu camera phạt nguội
│   │   ├── RoadSpeedLimit.swift # Giới hạn tốc độ theo đường
│   │   └── TripLocation.swift # Lịch sử vị trí & chuyến đi
│   ├── Services/
│   │   ├── LocationManager.swift     # CoreLocation, Background GPS, Logic cảnh báo
│   │   ├── CameraStore.swift         # Bộ nhớ & tìm kiếm không gian (Spatial search)
│   │   ├── RoadSpeedLimitService.swift # Tra cứu giới hạn tốc độ đường Overpass API
│   │   ├── OsmCameraSyncService.swift # Đồng bộ camera từ OSM Overpass API
│   │   ├── VoiceAlertManager.swift   # Giọng nói tiếng Việt & Audio Player
│   │   └── TripRecorder.swift        # Ghi nhận và lưu trữ hành trình
│   ├── Utils/
│   │   ├── GeoUtils.swift     # Tính khoảng cách Haversine, Bearing, Bounding Box
│   │   └── GpsUtils.swift     # Chuyển đổi km/h, kiểm tra vị trí hợp lệ
│   ├── Views/
│   │   ├── MainTabView.swift         # Thanh TabBar chính
│   │   ├── DashboardView.swift       # Màn hình HUD buồng lái
│   │   ├── SpeedometerView.swift     # Đồng hồ tốc độ kỹ thuật số
│   │   ├── SpeedLimitSignView.swift  # Biển báo tốc độ chuẩn Việt Nam
│   │   ├── CameraMapView.swift       # Bản đồ MapKit hiển thị camera
│   │   ├── TripHistoryView.swift     # Danh sách các chuyến đi đã lưu
│   │   └── SettingsView.swift        # Màn hình cài đặt ngưỡng, test giọng nói
│   └── Resources/
│       ├── speed_cameras_vietnam.json # Dữ liệu camera Việt Nam
│       ├── ai_cameras_hanoi.json      # Dữ liệu camera phạt nguội Hà Nội
│       ├── warning_speed.wav          # Âm thanh cảnh báo vượt tốc
│       ├── warning_camera.wav         # Âm thanh cảnh báo camera
│       ├── warning_redlight.wav       # Âm thanh cảnh báo đèn đỏ
│       ├── warning_generic.wav        # Âm thanh cảnh báo chung
│       └── Assets.xcassets/           # App Icon & Color palette
└── README.md
```

---

## 🚀 Hướng dẫn mở và chạy trên máy tính Mac

### Yêu cầu:
- Máy tính macOS (macOS 14 Sonoma hoặc macOS 15 Sequoia).
- Xcode 15 trở lên.
- Thiết bị thử nghiệm: iPhone chạy iOS 16.0+ hoặc Xcode Simulator.

### Các bước thực hiện:

1. **Mở dự án:**
   - Mở ứng dụng **Xcode**.
   - Chọn **Open a project or file** và trỏ đến thư mục:
     ```bash
     ios/SpeedNotify.xcodeproj
     ```

2. **Cấu hình Signing & Capabilities:**
   - Trong thanh điều hướng bên trái của Xcode, click chọn target **SpeedNotify** ở mục gốc.
   - Chuyển sang tab **Signing & Capabilities**.
   - Tại mục **Team**, chọn Apple ID / Developer Team của bạn.
   - Đảm bảo các quyền đã được kích hoạt sẵn:
     - `Background Modes`: Đã tích chọn `Location updates` và `Audio, AirPlay, and Picture in Picture`.

3. **Chạy ứng dụng:**
   - Chọn thiết bị đích ở thanh công cụ trên cùng (ví dụ: *iPhone 15 Pro Simulator* hoặc iPhone cắm cáp thật).
   - Nhấn nút **Play ▶️ (Cmd + R)** để biên dịch và chạy.

4. **Cách giả lập tốc độ và di chuyển trên Simulator:**
   - Khi Simulator đang mở app SpeedNotify, vào menu Xcode:
     **Features** -> **Location** -> Chọn **Freeway Drive** hoặc **City Run**.
   - Bạn sẽ thấy kim đồng hồ tốc độ nhảy lên ~80-100 km/h, biển báo tốc độ cập nhật và giọng nói tiếng Việt phát cảnh báo khi vượt quá tốc độ giới hạn!

