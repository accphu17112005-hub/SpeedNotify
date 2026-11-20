import Foundation
import CoreLocation

/// Quản lý và lưu trữ lịch sử các chuyến đi (Trip Locations & Records)
public final class TripRecorder: ObservableObject {
    public static let shared = TripRecorder()

    @Published public private(set) var activeTripLocations: [TripLocation] = []
    @Published public private(set) var tripHistory: [TripRecord] = []
    @Published public private(set) var currentTripDistanceMeters: Double = 0.0
    @Published public private(set) var currentTripMaxSpeedKmh: Double = 0.0

    private var activeTripStartTime: Date?
    private let tripsKey = "speednotify_recorded_trips"

    public init() {
        loadHistory()
    }

    /// Bắt đầu một chuyến đi mới
    public func startTrip() {
        activeTripLocations.removeAll()
        currentTripDistanceMeters = 0.0
        currentTripMaxSpeedKmh = 0.0
        activeTripStartTime = Date()
    }

    /// Ghi nhận điểm GPS mới trong hành trình
    public func recordPoint(location: CLLocation, speedKmh: Double) {
        guard let _ = activeTripStartTime else { return }

        let point = TripLocation(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            speedKmh: speedKmh,
            timestamp: location.timestamp,
            accuracy: location.horizontalAccuracy
        )

        if let lastPoint = activeTripLocations.last {
            let dist = GeoUtils.haversineDistance(
                lat1: lastPoint.latitude,
                lng1: lastPoint.longitude,
                lat2: point.latitude,
                lng2: point.longitude
            )
            // Lọc jitter nhỏ dưới 2m
            if dist >= 2.0 {
                currentTripDistanceMeters += dist
            }
        }

        if speedKmh > currentTripMaxSpeedKmh {
            currentTripMaxSpeedKmh = speedKmh
        }

        activeTripLocations.append(point)
    }

    /// Kết thúc chuyến đi và lưu lại vào lịch sử
    public func stopTrip() {
        guard let start = activeTripStartTime, !activeTripLocations.isEmpty else {
            activeTripStartTime = nil
            return
        }

        let end = Date()
        let avgSpeed: Double
        let durationHours = end.timeIntervalSince(start) / 3600.0
        if durationHours > 0 {
            avgSpeed = (currentTripDistanceMeters / 1000.0) / durationHours
        } else {
            avgSpeed = 0.0
        }

        let record = TripRecord(
            startTime: start,
            endTime: end,
            totalDistanceMeters: currentTripDistanceMeters,
            maxSpeedKmh: currentTripMaxSpeedKmh,
            averageSpeedKmh: avgSpeed,
            pointsCount: activeTripLocations.count
        )

        tripHistory.insert(record, at: 0)
        saveHistory()

        activeTripStartTime = nil
        activeTripLocations.removeAll()
    }

    private func loadHistory() {
        guard let data = UserDefaults.standard.data(forKey: tripsKey) else { return }
        do {
            tripHistory = try JSONDecoder().decode([TripRecord].self, from: data)
        } catch {
            // Ignored
        }
    }

    private func saveHistory() {
        do {
            let data = try JSONEncoder().encode(tripHistory)
            UserDefaults.standard.set(data, forKey: tripsKey)
        } catch {
            // Ignored
        }
    }

    public func clearHistory() {
        tripHistory.removeAll()
        UserDefaults.standard.removeObject(forKey: tripsKey)
    }
}

