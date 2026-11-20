import Foundation

/// Đại diện giới hạn tốc độ của đoạn đường hiện tại (lấy từ OSM Overpass hoặc cache)
public struct RoadSpeedLimit: Equatable, Codable {
    public let speedKmh: Int
    public let roadName: String?

    public init(speedKmh: Int, roadName: String?) {
        self.speedKmh = speedKmh
        self.roadName = roadName
    }
}

