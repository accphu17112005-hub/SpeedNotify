import SwiftUI

/// Thanh điều hướng Tab Bar chính của ứng dụng
public struct MainTabView: View {
    @State private var selectedTab: Int = 0

    public var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Bảng điều khiển", systemImage: "gauge.with.needle.fill")
                }
                .tag(0)

            CameraMapView()
                .tabItem {
                    Label("Bản đồ", systemImage: "map.fill")
                }
                .tag(1)

            TripHistoryView()
                .tabItem {
                    Label("Lịch sử", systemImage: "clock.arrow.circlepath")
                }
                .tag(2)

            SettingsView()
                .tabItem {
                    Label("Cài đặt", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .tint(.cyan)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(Color(red: 0.08, green: 0.09, blue: 0.12), for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }
}

#Preview {
    MainTabView()
}

