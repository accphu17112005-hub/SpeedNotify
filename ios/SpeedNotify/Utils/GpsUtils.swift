import Foundation
import CoreLocation

/// Các tiện ích kiểm tra và xử lý dữ liệu GPS (tương thích GpsUtils của Android)
public struct GpsUtils {

    private static let minAccuracyMeters: Double = 50.0
    private static let minSpeedKmh: Double = 1.0
    private static let msToKmh: Double = 3.6

    /// Chuyển đổi tốc độ từ m/s sang km/h
    public static func speedMsToKmh(_ speedMs: Double) -> Double {
        return max(0, speedMs * msToKmh)
    }

    /// Kiểm tra location có hợp lệ để tính toán tốc độ không
    public static func isValidForSpeedCalculation(_ location: CLLocation) -> Bool {
        guard location.horizontalAccuracy >= 0,
              location.horizontalAccuracy <= minAccuracyMeters,
              location.speed >= 0 else {
            return false
        }
        let speedKmh = speedMsToKmh(location.speed)
        return speedKmh >= minSpeedKmh
    }

    /// Lấy tốc độ km/h từ location, trả về -1 nếu không hợp lệ
    public static func getValidSpeedKmh(_ location: CLLocation) -> Double {
        if isValidForSpeedCalculation(location) {
            return speedMsToKmh(location.speed)
        } else {
            return -1.0
        }
    }

    /// Kiểm tra xem có vượt quá giới hạn tốc độ không
    public static func isOverSpeedLimit(
        currentSpeedKmh: Double,
        speedLimit: Int,
        thresholdKmh: Double = 0.0
    ) -> Bool {
        guard speedLimit > 0 else { return false }
        return currentSpeedKmh > (Double(speedLimit) + thresholdKmh)
    }
}

