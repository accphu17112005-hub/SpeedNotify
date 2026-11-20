import SwiftUI

@main
struct SpeedNotifyApp: App {
    init() {
        // Khởi động sẵn dữ liệu camera và quản lý âm thanh
        _ = CameraStore.shared
        _ = VoiceAlertManager.shared
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark) // Mặc định giao diện tối phong cách đồng hồ xe hơi
        }
    }
}

