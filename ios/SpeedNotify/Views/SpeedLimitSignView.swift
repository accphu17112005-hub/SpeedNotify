import SwiftUI

/// Biển báo giới hạn tốc độ chuẩn giao thông Việt Nam (Hình tròn viền đỏ, nền trắng, số đen)
public struct SpeedLimitSignView: View {
    public let speedLimit: Int
    public var size: CGFloat = 80

    public init(speedLimit: Int, size: CGFloat = 80) {
        self.speedLimit = speedLimit
        self.size = size
    }

    public var body: some View {
        ZStack {
            // Nền trắng
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)

            // Viền đỏ chuẩn biển báo
            Circle()
                .strokeBorder(Color(red: 0.88, green: 0.15, blue: 0.15), lineWidth: size * 0.12)
                .frame(width: size, height: size)

            // Số giới hạn tốc độ
            if speedLimit > 0 {
                Text("\(speedLimit)")
                    .font(.system(size: size * 0.42, weight: .black, design: .rounded))
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
            } else {
                Text("--")
                    .font(.system(size: size * 0.40, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    HStack(spacing: 20) {
        SpeedLimitSignView(speedLimit: 50, size: 70)
        SpeedLimitSignView(speedLimit: 60, size: 70)
        SpeedLimitSignView(speedLimit: 80, size: 70)
        SpeedLimitSignView(speedLimit: 120, size: 70)
    }
    .padding()
    .background(Color.black)
}

