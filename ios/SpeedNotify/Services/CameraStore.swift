import Foundation
import CoreLocation

/// Quản lý dữ liệu camera phạt nguội & điểm bắn tốc độ (in-memory + persistent cache)
public final class CameraStore: ObservableObject {
    public static let shared = CameraStore()

    @Published public private(set) var cameras: [Camera] = []
    @Published public private(set) var isLoading: Bool = false
    @Published public private(set) var lastUpdated: Date?

    private let cacheFileName = "speednotify_cameras_cache.json"
    private let queue = DispatchQueue(label: "com.speednotify.camerastore", qos: .userInitiated)

    public init() {
        loadInitialData()
    }

    /// Tải dữ liệu ban đầu từ Cache hoặc Bundled JSONs
    public func loadInitialData() {
        queue.async { [weak self] in
            guard let self = self else { return }

            // 1. Thử đọc từ local cache trong Documents
            if let cached = self.loadFromDocumentsCache(), !cached.isEmpty {
                DispatchQueue.main.async {
                    self.cameras = cached
                    self.lastUpdated = Date()
                }
                return
            }

            // 2. Nếu chưa có cache, load từ bundle JSONs (speed_cameras_vietnam.json & ai_cameras_hanoi.json)
            var loaded: [Camera] = []
            loaded.append(contentsOf: self.loadFromBundleJson(named: "speed_cameras_vietnam"))
            loaded.append(contentsOf: self.loadFromBundleJson(named: "ai_cameras_hanoi"))

            DispatchQueue.main.async {
                self.cameras = loaded
                self.lastUpdated = Date()
                // Lưu vào cache documents để các lần sau đọc nhanh
                self.saveToDocumentsCache(cameras: loaded)
            }
        }
    }

    /// Lọc các camera nằm trong bounding box
    public func camerasIn(boundingBox: GeoUtils.BoundingBox) -> [Camera] {
        return cameras.filter { camera in
            boundingBox.contains(lat: camera.lat, lng: camera.lng)
        }
    }

    /// Tìm camera gần nhất trong bán kính
    public func findNearest(
        latitude: Double,
        longitude: Double,
        maxDistanceMeters: Double
    ) -> (camera: Camera, distance: Double)? {
        let box = GeoUtils.createBoundingBoxMeters(
            centerLat: latitude,
            centerLng: longitude,
            radiusMeters: maxDistanceMeters
        )
        let candidates = camerasIn(boundingBox: box)
        return GeoUtils.nearestCameraWithinDistance(
            cameras: candidates,
            latitude: latitude,
            longitude: longitude,
            maxDistanceMeters: maxDistanceMeters
        )
    }

    /// Upsert danh sách camera từ OpenStreetMap
    public func upsertOsmCameras(_ newCameras: [Camera]) {
        queue.async { [weak self] in
            guard let self = self else { return }
            var currentDict = [String: Camera]()

            for cam in self.cameras {
                let key = cam.osmId != nil ? "osm_\(cam.osmId!)" : "id_\(cam.id)"
                currentDict[key] = cam
            }

            for cam in newCameras {
                let key = cam.osmId != nil ? "osm_\(cam.osmId!)" : "id_\(cam.id)"
                currentDict[key] = cam
            }

            let updatedList = Array(currentDict.values)
            self.saveToDocumentsCache(cameras: updatedList)

            DispatchQueue.main.async {
                self.cameras = updatedList
                self.lastUpdated = Date()
            }
        }
    }

    // MARK: - Private Helpers

    private func loadFromBundleJson(named fileName: String) -> [Camera] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                return []
            }
            return jsonArray.compactMap { dict -> Camera? in
                guard let lat = dict["latitude"] as? Double,
                      let lng = dict["longitude"] as? Double else {
                    return nil
                }
                let rawType = (dict["type"] as? String ?? "").uppercased()
                let camType: CameraType
                switch rawType {
                case "SPEED_CAMERA", "HIGHWAY": camType = .speed
                case "RED_LIGHT_CAMERA": camType = .redlight
                case "AI_JUNCTION_CAMERA": camType = .ai
                default: camType = .speed
                }
                let speedLimit = dict["speedLimit"] as? Int ?? 0
                let name = dict["name"] as? String

                return Camera(
                    lat: lat,
                    lng: lng,
                    speedLimit: speedLimit,
                    bearing: -1.0,
                    type: camType,
                    roadName: name
                )
            }
        } catch {
            return []
        }
    }

    private func documentsCacheUrl() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
            .appendingPathComponent(cacheFileName)
    }

    private func loadFromDocumentsCache() -> [Camera]? {
        guard let url = documentsCacheUrl(), FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Camera].self, from: data)
        } catch {
            return nil
        }
    }

    private func saveToDocumentsCache(cameras: [Camera]) {
        guard let url = documentsCacheUrl() else { return }
        do {
            let data = try JSONEncoder().encode(cameras)
            try data.write(to: url, options: .atomic)
        } catch {
            // Log ignored
        }
    }
}

