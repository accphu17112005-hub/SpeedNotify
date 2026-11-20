import Foundation
import CoreLocation
import Combine

/// Quản lý GPS thời gian thực, chạy ngầm (Background Location) và kích hoạt cảnh báo (Port từ LocationForegroundService.kt)
public final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    public static let shared = LocationManager()

    private let clLocationManager = CLLocationManager()

    // Trạng thái xuất ra UI
    @Published public var currentLocation: CLLocation?
    @Published public var currentSpeedKmh: Double = 0.0
    @Published public var currentBearing: Float = 0.0
    @Published public var currentRoadSpeedLimit: RoadSpeedLimit?
    @Published public var nearestCamera: Camera?
    @Published public var nearestCameraDistance: Double = 0.0
    @Published public var isOverSpeed: Bool = false
    @Published public var activeAlertTitle: String?
    @Published public var activeAlertDetail: String?
    @Published public var isTracking: Bool = false
    @Published public var authorizationStatus: CLAuthorizationStatus = .notDetermined

    // Cấu hình người dùng (Lưu trong UserDefaults)
    @Published public var speedWarningEnabled: Bool = true {
        didSet { UserDefaults.standard.set(speedWarningEnabled, forKey: "speed_warning_enabled") }
    }
    @Published public var cameraWarningEnabled: Bool = true {
        didSet { UserDefaults.standard.set(cameraWarningEnabled, forKey: "camera_warning_enabled") }
    }
    @Published public var speedThresholdKmh: Double = 5.0 {
        didSet { UserDefaults.standard.set(speedThresholdKmh, forKey: "speed_threshold_kmh") }
    }

    // Các ngưỡng khoảng cách cảnh báo (750m cho speed/ai, 350m cho red light - khớp Android)
    private let speedCameraAlertDistance: Double = 750.0
    private let redLightCameraAlertDistance: Double = 350.0

    private var lastRoadLookupTime: TimeInterval = 0
    private let roadLookupInterval: TimeInterval = 10.0 // Tra cứu OSM speed limit mỗi 10s

    override private init() {
        super.init()
        loadUserSettings()
        setupLocationManager()
    }

    private func loadUserSettings() {
        if UserDefaults.standard.object(forKey: "speed_warning_enabled") != nil {
            speedWarningEnabled = UserDefaults.standard.bool(forKey: "speed_warning_enabled")
        }
        if UserDefaults.standard.object(forKey: "camera_warning_enabled") != nil {
            cameraWarningEnabled = UserDefaults.standard.bool(forKey: "camera_warning_enabled")
        }
        if UserDefaults.standard.object(forKey: "speed_threshold_kmh") != nil {
            speedThresholdKmh = UserDefaults.standard.double(forKey: "speed_threshold_kmh")
        }
    }

    private func setupLocationManager() {
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        clLocationManager.activityType = .automotiveNavigation
        clLocationManager.distanceFilter = 2.0 // Cập nhật mỗi 2m di chuyển

        authorizationStatus = clLocationManager.authorizationStatus
    }

    /// Xin quyền vị trí Always hoặc WhenInUse
    public func requestPermissions() {
        if authorizationStatus == .notDetermined {
            clLocationManager.requestAlwaysAuthorization()
        } else if authorizationStatus == .authorizedWhenInUse {
            clLocationManager.requestAlwaysAuthorization()
        }
    }

    /// Khởi động dịch vụ theo dõi tốc độ và cảnh báo
    public func startTracking() {
        guard !isTracking else { return }

        // Cấu hình Background Location Updates cho phép định vị khi tắt màn hình
        clLocationManager.allowsBackgroundLocationUpdates = true
        clLocationManager.showsBackgroundLocationIndicator = true
        clLocationManager.pausesLocationUpdatesAutomatically = false

        clLocationManager.startUpdatingLocation()
        clLocationManager.startUpdatingHeading()

        TripRecorder.shared.startTrip()
        isTracking = true
    }

    /// Dừng dịch vụ theo dõi
    public func stopTracking() {
        guard isTracking else { return }

        clLocationManager.stopUpdatingLocation()
        clLocationManager.stopUpdatingHeading()
        clLocationManager.allowsBackgroundLocationUpdates = false

        TripRecorder.shared.stopTrip()

        isTracking = false
        currentSpeedKmh = 0.0
        nearestCamera = nil
        nearestCameraDistance = 0.0
        isOverSpeed = false
        activeAlertTitle = nil
        activeAlertDetail = nil
    }

    // MARK: - CLLocationManagerDelegate

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async {
            self.authorizationStatus = manager.authorizationStatus
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        DispatchQueue.main.async {
            self.processLocationUpdate(location)
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy >= 0 {
            DispatchQueue.main.async {
                self.currentBearing = Float(newHeading.trueHeading >= 0 ? newHeading.trueHeading : newHeading.magneticHeading)
            }
        }
    }

    // MARK: - Core Alert & Speed Processing Logic

    private func processLocationUpdate(_ location: CLLocation) {
        currentLocation = location

        // 1. Tốc độ
        let speed = GpsUtils.getValidSpeedKmh(location)
        currentSpeedKmh = speed >= 0 ? speed : 0.0

        if location.course >= 0 {
            currentBearing = Float(location.course)
        }

        // 2. Ghi nhận vào hành trình
        TripRecorder.shared.recordPoint(location: location, speedKmh: currentSpeedKmh)

        // 3. Tra cứu giới hạn tốc độ đường hiện tại (OSM Overpass) định kỳ
        let now = Date().timeIntervalSince1970
        if now - lastRoadLookupTime >= roadLookupInterval {
            lastRoadLookupTime = now
            Task {
                let roadLimit = await RoadSpeedLimitService.shared.findNearestSpeedLimit(
                    latitude: location.coordinate.latitude,
                    longitude: location.coordinate.longitude,
                    bearing: self.currentBearing
                )
                await MainActor.run {
                    self.currentRoadSpeedLimit = roadLimit
                }
            }
        }

        // 4. Tìm camera gần nhất trong bán kính 1000m
        let nearestMatch = CameraStore.shared.findNearest(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            maxDistanceMeters: 1000.0
        )

        var candidateCamera: Camera?
        var candidateDistance: Double = 0.0

        if let (camera, dist) = nearestMatch {
            // Kiểm tra hướng nếu camera có thông số bearing
            var isDirectionMatch = true
            if camera.bearing >= 0 && self.currentBearing >= 0 {
                if GeoUtils.isOppositeDirection(bearing1: self.currentBearing, bearing2: camera.bearing) {
                    isDirectionMatch = false
                }
            }

            if isDirectionMatch {
                candidateCamera = camera
                candidateDistance = dist
            }
        }

        nearestCamera = candidateCamera
        nearestCameraDistance = candidateDistance

        // 5. Xác định giới hạn tốc độ hiệu dụng (Ưu tiên camera nếu đang trong tầm 750m, nếu không dùng đường hiện tại)
        var effectiveSpeedLimit: Int = 0
        if let cam = candidateCamera, cam.speedLimit > 0, candidateDistance <= speedCameraAlertDistance {
            effectiveSpeedLimit = cam.speedLimit
        } else if let road = currentRoadSpeedLimit, road.speedKmh > 0 {
            effectiveSpeedLimit = road.speedKmh
        }

        // 6. Đánh giá vượt tốc độ
        if effectiveSpeedLimit > 0 {
            let overSpeeding = GpsUtils.isOverSpeedLimit(
                currentSpeedKmh: currentSpeedKmh,
                speedLimit: effectiveSpeedLimit,
                thresholdKmh: speedThresholdKmh
            )
            isOverSpeed = overSpeeding

            if overSpeeding && speedWarningEnabled {
                VoiceAlertManager.shared.warnOverSpeed(
                    currentSpeed: currentSpeedKmh,
                    speedLimit: effectiveSpeedLimit
                )
            }
        } else {
            isOverSpeed = false
        }

        // 7. Cảnh báo camera phía trước
        if let cam = candidateCamera, cameraWarningEnabled {
            let threshold = (cam.type == .redlight) ? redLightCameraAlertDistance : speedCameraAlertDistance
            if candidateDistance <= threshold {
                activeAlertTitle = cam.type.titleVi
                activeAlertDetail = "Cách \(Int(candidateDistance))m" + (cam.speedLimit > 0 ? " • Giới hạn \(cam.speedLimit) km/h" : "")

                VoiceAlertManager.shared.warnCameraAhead(camera: cam, distanceMeters: candidateDistance)
            } else {
                activeAlertTitle = nil
                activeAlertDetail = nil
            }
        } else {
            activeAlertTitle = nil
            activeAlertDetail = nil
        }
    }
}

