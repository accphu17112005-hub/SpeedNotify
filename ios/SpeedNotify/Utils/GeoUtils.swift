import Foundation
import CoreLocation

/// Các tiện ích tính toán địa lý và khoảng cách (tương thích GeoUtils của Android)
public struct GeoUtils {

    private static let earthRadiusMeters: Double = 6_371_000.0

    /// Tính khoảng cách Haversine giữa 2 tọa độ (đơn vị: mét)
    public static func haversineDistance(
        lat1: Double,
        lng1: Double,
        lat2: Double,
        lng2: Double
    ) -> Double {
        let dLat = (lat2 - lat1) * .pi / 180.0
        let dLng = (lng2 - lng1) * .pi / 180.0
        let lat1Rad = lat1 * .pi / 180.0
        let lat2Rad = lat2 * .pi / 180.0

        let a = sin(dLat / 2.0) * sin(dLat / 2.0) +
                cos(lat1Rad) * cos(lat2Rad) *
                sin(dLng / 2.0) * sin(dLng / 2.0)
        let c = 2.0 * atan2(sqrt(a), sqrt(1.0 - a))
        return earthRadiusMeters * c
    }

    /// Tính góc bearing từ điểm 1 đến điểm 2 (độ, 0 - 360)
    public static func calculateBearing(
        lat1: Double,
        lng1: Double,
        lat2: Double,
        lng2: Double
    ) -> Float {
        let dLng = (lng2 - lng1) * .pi / 180.0
        let lat1Rad = lat1 * .pi / 180.0
        let lat2Rad = lat2 * .pi / 180.0

        let y = sin(dLng) * cos(lat2Rad)
        let x = cos(lat1Rad) * sin(lat2Rad) -
                sin(lat1Rad) * cos(lat2Rad) * cos(dLng)
        let bearingRad = atan2(y, x)
        let bearingDeg = bearingRad * 180.0 / .pi
        let normalized = (bearingDeg + 360.0).truncatingRemainder(dividingBy: 360.0)
        return Float(normalized)
    }

    /// Kiểm tra xem 2 hướng di chuyển có ngược nhau không (chênh lệch > threshold độ, mặc định 90 độ)
    public static func isOppositeDirection(
        bearing1: Float,
        bearing2: Float,
        threshold: Float = 90.0
    ) -> Bool {
        let diff = abs(bearing1 - bearing2).truncatingRemainder(dividingBy: 360.0)
        let normalizedDiff = diff > 180.0 ? 360.0 - diff : diff
        return normalizedDiff > threshold
    }

    public struct BoundingBox {
        public let minLat: Double
        public let maxLat: Double
        public let minLng: Double
        public let maxLng: Double

        public init(minLat: Double, maxLat: Double, minLng: Double, maxLng: Double) {
            self.minLat = minLat
            self.maxLat = maxLat
            self.minLng = minLng
            self.maxLng = maxLng
        }

        public func contains(lat: Double, lng: Double) -> Bool {
            return lat >= minLat && lat <= maxLat && lng >= minLng && lng <= maxLng
        }
    }

    /// Tạo bounding box quanh tọa độ trung tâm (±degreeOffset)
    public static func createBoundingBox(
        centerLat: Double,
        centerLng: Double,
        degreeOffset: Double
    ) -> BoundingBox {
        return BoundingBox(
            minLat: centerLat - degreeOffset,
            maxLat: centerLat + degreeOffset,
            minLng: centerLng - degreeOffset,
            maxLng: centerLng + degreeOffset
        )
    }

    /// Tạo bounding box theo bán kính mét quanh tọa độ trung tâm
    public static func createBoundingBoxMeters(
        centerLat: Double,
        centerLng: Double,
        radiusMeters: Double
    ) -> BoundingBox {
        let latitudeOffset = radiusMeters / 111_320.0
        let longitudeScale = max(111_320.0 * cos(centerLat * .pi / 180.0), 1.0)
        let longitudeOffset = radiusMeters / longitudeScale
        let maxOffset = max(latitudeOffset, longitudeOffset)
        return createBoundingBox(centerLat: centerLat, centerLng: centerLng, degreeOffset: maxOffset)
    }

    /// Tìm camera gần nhất trong phạm vi bán kính maxDistanceMeters
    public static func nearestCameraWithinDistance(
        cameras: [Camera],
        latitude: Double,
        longitude: Double,
        maxDistanceMeters: Double
    ) -> (camera: Camera, distance: Double)? {
        var closest: (camera: Camera, distance: Double)?

        for camera in cameras {
            let dist = haversineDistance(
                lat1: latitude,
                lng1: longitude,
                lat2: camera.lat,
                lng2: camera.lng
            )
            if dist <= maxDistanceMeters {
                if let current = closest {
                    if dist < current.distance {
                        closest = (camera, dist)
                    }
                } else {
                    closest = (camera, dist)
                }
            }
        }
        return closest
    }
}

