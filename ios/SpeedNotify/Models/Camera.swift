import Foundation
import CoreLocation

public enum CameraType: String, Codable, CaseIterable {
    case speed = "speed"
    case redlight = "redlight"
    case ai = "ai"
    case other = "other"

    public var titleVi: String {
        switch self {
        case .speed: return "Camera tốc độ"
        case .redlight: return "Camera vượt đèn đỏ"
        case .ai: return "Camera AI / Phạt nguội"
        case .other: return "Camera giao thông"
        }
    }

    public var iconName: String {
        switch self {
        case .speed: return "speedometer"
        case .redlight: return "trafficlight.fill"
        case .ai: return "eye.circle.fill"
        case .other: return "video.fill"
        }
    }
}

public struct Camera: Identifiable, Codable, Equatable {
    public let id: String
    public let lat: Double
    public let lng: Double
    public let speedLimit: Int
    public let bearing: Float
    public let type: CameraType
    public let direction: String?
    public let roadName: String?
    public let province: String?
    public let district: String?
    public let ward: String?
    public let osmId: Int64?

    public init(
        id: String = UUID().uuidString,
        lat: Double,
        lng: Double,
        speedLimit: Int,
        bearing: Float = -1.0,
        type: CameraType = .speed,
        direction: String? = nil,
        roadName: String? = nil,
        province: String? = nil,
        district: String? = nil,
        ward: String? = nil,
        osmId: Int64? = nil
    ) {
        self.id = id
        self.lat = lat
        self.lng = lng
        self.speedLimit = speedLimit
        self.bearing = bearing
        self.type = type
        self.direction = direction
        self.roadName = roadName
        self.province = province
        self.district = district
        self.ward = ward
        self.osmId = osmId
    }

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    public var displayName: String {
        if let road = roadName, !road.isEmpty {
            return road
        }
        if let prov = province, !prov.isEmpty {
            return "\(type.titleVi) - \(prov)"
        }
        return type.titleVi
    }
}

