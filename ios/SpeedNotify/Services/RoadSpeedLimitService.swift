import Foundation
import CoreLocation

/// Service tra cứu giới hạn tốc độ đoạn đường hiện tại qua OpenStreetMap Overpass API (Port từ RoadSpeedLimitRepository.kt)
public final class RoadSpeedLimitService {
    public static let shared = RoadSpeedLimitService()

    private let searchRadiusMeters: Double = 500.0
    private let cacheRadiusMeters: Double = 350.0
    private let cacheDurationSeconds: TimeInterval = 60.0
    private let maxMatchDistanceMeters: Double = 45.0

    private let endpoints = [
        "https://overpass-api.de/api/interpreter",
        "https://overpass.kumi.systems/api/interpreter",
        "https://maps.mail.ru/osm/tools/overpass/api/interpreter"
    ]

    private var cachedCenter: CLLocationCoordinate2D?
    private var cachedAt: Date?
    private var cachedSegments: [RoadSegment] = []
    private let lock = NSLock()

    private struct RoadSegment {
        let name: String?
        let speedLimitKmh: Int
        let coordinates: [CLLocationCoordinate2D]
    }

    public init() {}

    /// Tìm giới hạn tốc độ gần nhất cho tọa độ hiện tại
    public func findNearestSpeedLimit(
        latitude: Double,
        longitude: Double,
        bearing: Float? = nil
    ) async -> RoadSpeedLimit? {
        lock.lock()
        let isCacheValid: Bool
        if let center = cachedCenter, let timestamp = cachedAt {
            let elapsed = Date().timeIntervalSince(timestamp)
            let dist = GeoUtils.haversineDistance(
                lat1: latitude,
                lng1: longitude,
                lat2: center.latitude,
                lng2: center.longitude
            )
            isCacheValid = elapsed < cacheDurationSeconds && dist <= cacheRadiusMeters
        } else {
            isCacheValid = false
        }

        if isCacheValid {
            let segments = cachedSegments
            lock.unlock()
            return matchNearestSegment(latitude: latitude, longitude: longitude, bearing: bearing, segments: segments)
        }
        lock.unlock()

        // Fetch mới từ Overpass
        let segments = await fetchSegmentsFromOverpass(latitude: latitude, longitude: longitude)

        lock.lock()
        self.cachedSegments = segments
        self.cachedCenter = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.cachedAt = Date()
        lock.unlock()

        return matchNearestSegment(latitude: latitude, longitude: longitude, bearing: bearing, segments: segments)
    }

    private func fetchSegmentsFromOverpass(latitude: Double, longitude: Double) async -> [RoadSegment] {
        let query = """
        [out:json][timeout:15];
        way(around:\(searchRadiusMeters),\(latitude),\(longitude))["highway"]["maxspeed"];
        out tags geom;
        """

        for endpoint in endpoints {
            guard let url = URL(string: endpoint) else { continue }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.timeoutInterval = 10.0
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("SpeedNotify/1.0 (iOS speed limit alerts)", forHTTPHeaderField: "User-Agent")

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

                var segments: [RoadSegment] = []
                for element in elements {
                    if let segment = parseSegment(from: element) {
                        segments.append(segment)
                    }
                }
                return segments
            } catch {
                continue
            }
        }
        return []
    }

    private func parseSegment(from json: [String: Any]) -> RoadSegment? {
        guard let tags = json["tags"] as? [String: Any],
              let maxspeedStr = tags["maxspeed"] as? String else {
            return nil
        }

        // Parse speed number (e.g. "60", "60 km/h", "VN:rural", etc.)
        let speed = parseSpeedLimit(maxspeedStr)
        guard speed > 0 else { return nil }

        let roadName = tags["name"] as? String ?? tags["ref"] as? String

        var coords: [CLLocationCoordinate2D] = []
        if let geometry = json["geometry"] as? [[String: Any]] {
            for pt in geometry {
                if let lat = pt["lat"] as? Double, let lon = pt["lon"] as? Double {
                    coords.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                }
            }
        }

        return RoadSegment(name: roadName, speedLimitKmh: speed, coordinates: coords)
    }

    private func parseSpeedLimit(_ string: String) -> Int {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        // Extract digits
        let digits = trimmed.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if let val = Int(digits), val > 0 && val <= 140 {
            return val
        }
        // Fallbacks for Vietnam zone tags
        if trimmed.contains("urban") { return 50 }
        if trimmed.contains("rural") { return 80 }
        if trimmed.contains("motorway") { return 100 }
        return 0
    }

    private func matchNearestSegment(
        latitude: Double,
        longitude: Double,
        bearing: Float?,
        segments: [RoadSegment]
    ) -> RoadSpeedLimit? {
        var closestSegment: RoadSegment?
        var minDistance = maxMatchDistanceMeters

        for segment in segments {
            // Kiểm tra khoảng cách từ vị trí đến các điểm trên segment
            for coord in segment.coordinates {
                let dist = GeoUtils.haversineDistance(
                    lat1: latitude,
                    lng1: longitude,
                    lat2: coord.latitude,
                    lng2: coord.longitude
                )
                if dist < minDistance {
                    minDistance = dist
                    closestSegment = segment
                }
            }
        }

        guard let match = closestSegment else { return nil }
        return RoadSpeedLimit(speedKmh: match.speedLimitKmh, roadName: match.name)
    }
}

