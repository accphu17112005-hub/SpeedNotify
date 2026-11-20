import Foundation
import CoreLocation

/// Điểm vị trí trong một hành trình di chuyển
public struct TripLocation: Identifiable, Codable, Equatable {
    public let id: UUID
    public let latitude: Double
    public let longitude: Double
    public let speedKmh: Double
    public let timestamp: Date
    public let accuracy: Double

    public init(
        id: UUID = UUID(),
        latitude: Double,
        longitude: Double,
        speedKmh: Double,
        timestamp: Date = Date(),
        accuracy: Double = 0
    ) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.speedKmh = speedKmh
        self.timestamp = timestamp
        self.accuracy = accuracy
    }

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

/// Một chuyến đi đã hoàn thành
public struct TripRecord: Identifiable, Codable, Equatable {
    public let id: UUID
    public let startTime: Date
    public let endTime: Date
    public let totalDistanceMeters: Double
    public let maxSpeedKmh: Double
    public let averageSpeedKmh: Double
    public let pointsCount: Int

    public init(
        id: UUID = UUID(),
        startTime: Date,
        endTime: Date,
        totalDistanceMeters: Double,
        maxSpeedKmh: Double,
        averageSpeedKmh: Double,
        pointsCount: Int
    ) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.totalDistanceMeters = totalDistanceMeters
        self.maxSpeedKmh = maxSpeedKmh
        self.averageSpeedKmh = averageSpeedKmh
        self.pointsCount = pointsCount
    }

    public var durationSeconds: TimeInterval {
        endTime.timeIntervalSince(startTime)
    }

    public var formattedDistance: String {
        if totalDistanceMeters >= 1000.0 {
            return String(format: "%.1f km", totalDistanceMeters / 1000.0)
        } else {
            return String(format: "%.0f m", totalDistanceMeters)
        }
    }

    public var formattedDuration: String {
        let mins = Int(durationSeconds) / 60
        let hours = mins / 60
        let remainingMins = mins % 60
        if hours > 0 {
            return "\(hours)h \(remainingMins)m"
        } else {
            return "\(mins) phút"
        }
    }
}

