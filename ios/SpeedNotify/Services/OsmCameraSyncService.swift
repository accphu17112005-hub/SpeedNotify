import Foundation
import CoreLocation

/// Service đồng bộ dữ liệu camera phạt nguội và điểm bắn tốc độ từ OpenStreetMap Overpass API (Port từ OsmCameraRepository.kt)
public final class OsmCameraSyncService: ObservableObject {
    public static let shared = OsmCameraSyncService()

    @Published public private(set) var isSyncing: Bool = false
    @Published public private(set) var lastSyncMessage: String = ""

    private let refreshIntervalSeconds: TimeInterval = 24 * 3600 // 24 giờ
    private let lastSyncKey = "osm_last_sync_timestamp"

    private let overpassEndpoints = [
        "https://overpass-api.de/api/interpreter",
        "https://overpass.kumi.systems/api/interpreter",
        "https://maps.mail.ru/osm/tools/overpass/api/interpreter"
    ]

    public init() {}

    /// Thực hiện đồng bộ camera từ Overpass API
    @discardableResult
    public func syncCameras(force: Bool = false) async -> Int {
        let lastSync = UserDefaults.standard.double(forKey: lastSyncKey)
        let elapsed = Date().timeIntervalSince1970 - lastSync

        if !force && elapsed < refreshIntervalSeconds {
            let hoursAgo = Int(elapsed / 3600)
            await MainActor.run {
                self.lastSyncMessage = "Dữ liệu camera đã được cập nhật \(hoursAgo) giờ trước."
            }
            return -1
        }

        await MainActor.run {
            self.isSyncing = true
            self.lastSyncMessage = "Đang tải dữ liệu camera phạt nguội từ OpenStreetMap..."
        }

        let query = """
        [out:json][timeout:30];
        (
          node["highway"="speed_camera"](8.0,102.0,23.5,109.5);
          node["highway"="enforcement"](8.0,102.0,23.5,109.5);
        );
        out body;
        """

        var fetchedCameras: [Camera] = []

        for endpoint in overpassEndpoints {
            guard let url = URL(string: endpoint) else { continue }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.timeoutInterval = 25.0
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("SpeedNotify/1.0 (iOS OpenStreetMap sync)", forHTTPHeaderField: "User-Agent")

            let bodyString = "data=" + (query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
            request.httpBody = bodyString.data(using: .utf8)

            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    continue
                }

                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let elements = json["elements"] as? [[String: Any]] else {
                    continue
                }

                for elem in elements {
                    if let camera = parseOsmNode(elem) {
                        fetchedCameras.append(camera)
                    }
                }

                if !fetchedCameras.isEmpty {
                    break
                }
            } catch {
                continue
            }
        }

        if !fetchedCameras.isEmpty {
            CameraStore.shared.upsertOsmCameras(fetchedCameras)
            UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: lastSyncKey)

            let count = fetchedCameras.size
            await MainActor.run {
                self.isSyncing = false
                self.lastSyncMessage = "Đã cập nhật \(fetchedCameras.count) camera mới từ OpenStreetMap!"
            }
            return fetchedCameras.count
        } else {
            await MainActor.run {
                self.isSyncing = false
                self.lastSyncMessage = "Không có dữ liệu mới hoặc lỗi kết nối máy chủ."
            }
            return 0
        }
    }

    private func parseOsmNode(_ json: [String: Any]) -> Camera? {
        guard let id = json["id"] as? Int64,
              let lat = json["lat"] as? Double,
              let lon = json["lon"] as? Double else {
            return nil
        }

        let tags = json["tags"] as? [String: Any] ?? [:]
        let rawSpeed = tags["maxspeed"] as? String ?? ""
        let speedLimit = Int(rawSpeed.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 0

        var bearing: Float = -1.0
        if let directionStr = tags["direction"] as? String, let dirFloat = Float(directionStr) {
            bearing = dirFloat
        }

        let enforcementType = tags["enforcement"] as? String ?? tags["highway"] as? String ?? ""
        let camType: CameraType
        if enforcementType.contains("traffic_signals") || enforcementType.contains("red_light") {
            camType = .redlight
        } else if enforcementType.contains("ai") || enforcementType.contains("monitoring") {
            camType = .ai
        } else {
            camType = .speed
        }

        let name = tags["name"] as? String ?? tags["description"] as? String

        return Camera(
            lat: lat,
            lng: lon,
            speedLimit: speedLimit,
            bearing: bearing,
            type: camType,
            roadName: name,
            osmId: id
        )
    }
}

