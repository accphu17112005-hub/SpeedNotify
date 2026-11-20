import SwiftUI

/// Màn hình cài đặt cảnh báo & kiểm tra âm thanh (Tương thích SettingsActivity.kt)
public struct SettingsView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var cameraStore = CameraStore.shared
    @ObservedObject var osmSync = OsmCameraSyncService.shared

    @State private var ttsTestingMessage = ""

    public var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.07, green: 0.08, blue: 0.11)
                    .edgesIgnoringSafeArea(.all)

                Form {
                    // MARK: - Cảnh báo âm thanh & tốc độ
                    Section(header: Text("CẢNH BÁO TỐC ĐỘ & CAMERA").foregroundColor(.cyan)) {
                        Toggle(isOn: $locationManager.speedWarningEnabled) {
                            Label("Cảnh báo vượt quá tốc độ", systemImage: "exclamationmark.triangle.fill")
                        }

                        Toggle(isOn: $locationManager.cameraWarningEnabled) {
                            Label("Cảnh báo camera phạt nguội", systemImage: "camera.fill")
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Ngưỡng cảnh báo vượt tốc:")
                                Spacer()
                                Text("+\(Int(locationManager.speedThresholdKmh)) km/h")
                                    .fontWeight(.bold)
                                    .foregroundColor(.orange)
                            }
                            Picker("Ngưỡng vượt tốc", selection: $locationManager.speedThresholdKmh) {
                                Text("+0 km/h (Báo ngay)").tag(0.0)
                                Text("+5 km/h (Mặc định)").tag(5.0)
                                Text("+10 km/h").tag(10.0)
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.vertical, 4)
                    }
                    .listRowBackground(Color.white.opacity(0.05))

                    // MARK: - Kiểm tra âm thanh & Giọng đọc
                    Section(header: Text("KIỂM TRA ÂM THANH & GIỌNG ĐỌC").foregroundColor(.cyan)) {
                        Button(action: {
                            VoiceAlertManager.shared.speak("Kiểm tra giọng nói tiếng Việt thành công. Chúc bạn lái xe an toàn!", force: true)
                        }) {
                            HStack {
                                Label("Thử giọng đọc tiếng Việt (TTS)", systemImage: "speaker.wave.2.fill")
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.cyan)
                            }
                        }

                        Button(action: {
                            VoiceAlertManager.shared.playSound(named: "warning_speed")
                        }) {
                            HStack {
                                Label("Thử âm thanh cảnh báo tốc độ", systemImage: "waveform")
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.cyan)
                            }
                        }

                        Button(action: {
                            VoiceAlertManager.shared.playSound(named: "warning_camera")
                        }) {
                            HStack {
                                Label("Thử âm thanh camera phạt nguội", systemImage: "waveform")
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.cyan)
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.05))

                    // MARK: - Dữ liệu Camera
                    Section(header: Text("CƠ SỞ DỮ LIỆU CAMERA").foregroundColor(.cyan)) {
                        HStack {
                            Text("Tổng số camera trong máy:")
                            Spacer()
                            Text("\(cameraStore.cameras.count)")
                                .fontWeight(.bold)
                                .foregroundColor(.cyan)
                        }

                        Button(action: {
                            Task {
                                await osmSync.syncCameras(force: true)
                            }
                        }) {
                            HStack {
                                Label("Cập nhật camera từ OpenStreetMap", systemImage: "arrow.clockwise")
                                Spacer()
                                if osmSync.isSyncing {
                                    ProgressView()
                                }
                            }
                        }
                        .disabled(osmSync.isSyncing)

                        if !osmSync.lastSyncMessage.isEmpty {
                            Text(osmSync.lastSyncMessage)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.05))

                    // MARK: - Quyền hệ thống & Thông tin ứng dụng
                    Section(header: Text("THÔNG TIN").foregroundColor(.cyan)) {
                        HStack {
                            Text("Quyền vị trí GPS:")
                            Spacer()
                            Text(locationStatusText)
                                .foregroundColor(locationStatusColor)
                                .fontWeight(.medium)
                        }

                        HStack {
                            Text("Chạy ngầm (Background Location):")
                            Spacer()
                            Text("Đã hỗ trợ")
                                .foregroundColor(.green)
                        }

                        HStack {
                            Text("Phiên bản:")
                            Spacer()
                            Text("1.0.0 (iOS)")
                                .foregroundColor(.gray)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.05))
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Cài đặt")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private var locationStatusText: String {
        switch locationManager.authorizationStatus {
        case .authorizedAlways: return "Luôn luôn (Tốt nhất)"
        case .authorizedWhenInUse: return "Khi dùng ứng dụng"
        case .denied, .restricted: return "Bị từ chối"
        case .notDetermined: return "Chưa yêu cầu"
        @unknown default: return "Không rõ"
        }
    }

    private var locationStatusColor: Color {
        switch locationManager.authorizationStatus {
        case .authorizedAlways: return .green
        case .authorizedWhenInUse: return .yellow
        default: return .red
        }
    }
}

#Preview {
    SettingsView()
}

