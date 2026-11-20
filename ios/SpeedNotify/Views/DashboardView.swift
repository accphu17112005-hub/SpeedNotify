import SwiftUI

/// Màn hình bảng điều khiển chính (HUD Dashboard)
public struct DashboardView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var cameraStore = CameraStore.shared
    @ObservedObject var tripRecorder = TripRecorder.shared

    private var effectiveSpeedLimit: Int {
        if let cam = locationManager.nearestCamera, cam.speedLimit > 0, locationManager.nearestCameraDistance <= 750.0 {
            return cam.speedLimit
        }
        return locationManager.currentRoadSpeedLimit?.speedKmh ?? 0
    }

    public var body: some View {
        NavigationStack {
            ZStack {
                // Nền tối phong cách buồng lái xe (Dark Cockpit Theme)
                Color(red: 0.07, green: 0.08, blue: 0.11)
                    .edgesIgnoringSafeArea(.all)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {

                        // MARK: - Header Status Bar
                        HStack {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(locationManager.isTracking ? Color.green : Color.gray)
                                    .frame(width: 10, height: 10)
                                Text(locationManager.isTracking ? "ĐANG HOẠT ĐỘNG" : "ĐÃ TẠM DỪNG")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(locationManager.isTracking ? .green : .gray)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.white.opacity(0.06))
                            .cornerRadius(12)

                            Spacer()

                            HStack(spacing: 4) {
                                Image(systemName: "video.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.cyan)
                                Text("\(cameraStore.cameras.count) điểm")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.white.opacity(0.06))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)

                        // MARK: - Speedometer HUD & Speed Limit Sign
                        ZStack(alignment: .topTrailing) {
                            SpeedometerView(
                                currentSpeedKmh: locationManager.currentSpeedKmh,
                                speedLimit: effectiveSpeedLimit,
                                isOverSpeed: locationManager.isOverSpeed,
                                size: 270
                            )
                            .frame(maxWidth: .infinity)

                            // Biển báo tốc độ nổi ở góc trên phải
                            SpeedLimitSignView(
                                speedLimit: effectiveSpeedLimit,
                                size: 68
                            )
                            .padding(.trailing, 24)
                            .padding(.top, 10)
                        }

                        // MARK: - Tên đoạn đường hiện tại
                        HStack(spacing: 8) {
                            Image(systemName: "signpost.right.and.left.fill")
                                .foregroundColor(.cyan)
                            Text(locationManager.currentRoadSpeedLimit?.roadName ?? "Đường chưa xác định tên")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(20)

                        // MARK: - Banner Cảnh báo Camera / Phạt nguội
                        if let alertTitle = locationManager.activeAlertTitle,
                           let alertDetail = locationManager.activeAlertDetail {
                            VStack(spacing: 6) {
                                HStack(spacing: 12) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.red.opacity(0.2))
                                            .frame(width: 44, height: 44)
                                        Image(systemName: locationManager.nearestCamera?.type.iconName ?? "exclamationmark.triangle.fill")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.red)
                                    }

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(alertTitle)
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)

                                        Text(alertDetail)
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.white.opacity(0.8))
                                    }

                                    Spacer()

                                    Image(systemName: "speaker.wave.3.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 18))
                                }
                                .padding(14)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(red: 0.22, green: 0.08, blue: 0.08))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.red.opacity(0.6), lineWidth: 1.5)
                                        )
                                )
                            }
                            .padding(.horizontal)
                            .transition(.scale.combined(with: .opacity))
                            .animation(.spring(), value: alertTitle)
                        }

                        // MARK: - Thông số chuyến đi hiện tại (Trip Stats)
                        HStack(spacing: 12) {
                            statCard(
                                title: "QUÃNG ĐƯỜNG",
                                value: String(format: "%.1f", tripRecorder.currentTripDistanceMeters / 1000.0),
                                unit: "km",
                                icon: "arrow.triangle.swap"
                            )
                            statCard(
                                title: "TỐC ĐỘ TỐI ĐA",
                                value: "\(Int(tripRecorder.currentTripMaxSpeedKmh))",
                                unit: "km/h",
                                icon: "gauge.badge.plus"
                            )
                        }
                        .padding(.horizontal)

                        // MARK: - Nút Bắt đầu / Dừng theo dõi
                        Button(action: {
                            let impact = UIImpactFeedbackGenerator(style: .medium)
                            impact.impactOccurred()
                            if locationManager.isTracking {
                                locationManager.stopTracking()
                            } else {
                                locationManager.requestPermissions()
                                locationManager.startTracking()
                            }
                        }) {
                            HStack(spacing: 10) {
                                Image(systemName: locationManager.isTracking ? "stop.fill" : "play.fill")
                                    .font(.system(size: 18, weight: .bold))
                                Text(locationManager.isTracking ? "DỪNG THEO DÕI" : "BẮT ĐẦU CHẠY")
                                    .font(.system(size: 17, weight: .heavy))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                locationManager.isTracking ?
                                Color.red.gradient :
                                Color.cyan.gradient
                            )
                            .cornerRadius(18)
                            .shadow(color: (locationManager.isTracking ? Color.red : Color.cyan).opacity(0.4), radius: 10, y: 4)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 10)
                }
            }
            .navigationTitle("SpeedNotify")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private func statCard(title: String, value: String, unit: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(.cyan)
                Text(title)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.gray)
            }
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text(unit)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.white.opacity(0.04))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
    }
}

#Preview {
    DashboardView()
}

