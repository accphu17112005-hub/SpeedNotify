import SwiftUI
import MapKit

/// Màn hình bản đồ camera phạt nguội và vị trí xe (Tương thích MapActivity.kt)
public struct CameraMapView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var cameraStore = CameraStore.shared

    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 21.0285, longitude: 105.8542), // Hà Nội mặc định
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var trackingUser: Bool = true
    @State private var selectedCamera: Camera?
    @State private var mapType: MKMapType = .standard

    public var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Map View
            Map(coordinateRegion: $mapRegion,
                showsUserLocation: true,
                annotationItems: cameraStore.cameras) { camera in
                MapAnnotation(coordinate: camera.coordinate) {
                    Button(action: {
                        selectedCamera = camera
                    }) {
                        VStack(spacing: 2) {
                            ZStack {
                                Circle()
                                    .fill(pinColor(for: camera.type))
                                    .frame(width: 30, height: 30)
                                    .shadow(radius: 3)

                                Image(systemName: camera.type.iconName)
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                            }

                            if camera.speedLimit > 0 {
                                Text("\(camera.speedLimit)")
                                    .font(.system(size: 9, weight: .heavy))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 1)
                                    .background(Color.white)
                                    .cornerRadius(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.red, lineWidth: 1)
                                    )
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onChange(of: locationManager.currentLocation) { newLoc in
                if trackingUser, let loc = newLoc {
                    withAnimation {
                        mapRegion.center = loc.coordinate
                    }
                }
            }

            // MARK: - Top Floating Controls
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        // Nút căn giữa vị trí xe
                        Button(action: {
                            trackingUser = true
                            if let loc = locationManager.currentLocation {
                                withAnimation {
                                    mapRegion.center = loc.coordinate
                                    mapRegion.span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                                }
                            }
                        }) {
                            Image(systemName: trackingUser ? "location.fill" : "location")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(trackingUser ? .cyan : .white)
                                .frame(width: 44, height: 44)
                                .background(Color(red: 0.1, green: 0.12, blue: 0.16).opacity(0.9))
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }

                        // Nút đồng bộ OSM camera
                        Button(action: {
                            Task {
                                await OsmCameraSyncService.shared.syncCameras(force: true)
                            }
                        }) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color(red: 0.1, green: 0.12, blue: 0.16).opacity(0.9))
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 60)
                }
                Spacer()
            }

            // MARK: - Bottom HUD Overlay
            VStack(spacing: 12) {
                // Thẻ thông tin camera khi người dùng chạm vào marker
                if let cam = selectedCamera {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(pinColor(for: cam.type))
                                .frame(width: 40, height: 40)
                            Image(systemName: cam.type.iconName)
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text(cam.displayName)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                            HStack {
                                Text(cam.type.titleVi)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.7))
                                if cam.speedLimit > 0 {
                                    Text("• Giới hạn \(cam.speedLimit) km/h")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.orange)
                                }
                            }
                        }

                        Spacer()

                        Button(action: { selectedCamera = nil }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(12)
                    .background(Color(red: 0.12, green: 0.14, blue: 0.18).opacity(0.95))
                    .cornerRadius(16)
                    .padding(.horizontal)
                }

                // HUD Tốc độ + Biển báo tốc độ mini
                HStack(spacing: 16) {
                    HStack(spacing: 8) {
                        Text("\(Int(locationManager.currentSpeedKmh))")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(locationManager.isOverSpeed ? .red : .white)
                        Text("km/h")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    if let nearest = locationManager.nearestCamera, locationManager.nearestCameraDistance <= 1000 {
                        VStack(alignment: .trailing, spacing: 2) {
                            Text(nearest.type.titleVi)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white)
                            Text("còn \(Int(locationManager.nearestCameraDistance))m")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.orange)
                        }
                    }

                    let effectiveLimit = locationManager.nearestCamera?.speedLimit ?? locationManager.currentRoadSpeedLimit?.speedKmh ?? 0
                    SpeedLimitSignView(speedLimit: effectiveLimit > 0 ? effectiveLimit : 0, size: 50)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(Color(red: 0.08, green: 0.09, blue: 0.13).opacity(0.92))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.4), radius: 8, y: 4)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .onAppear {
            if let loc = locationManager.currentLocation {
                mapRegion.center = loc.coordinate
            }
        }
    }

    private func pinColor(for type: CameraType) -> Color {
        switch type {
        case .speed: return .red
        case .redlight: return .orange
        case .ai: return .purple
        case .other: return .blue
        }
    }
}

#Preview {
    CameraMapView()
}

